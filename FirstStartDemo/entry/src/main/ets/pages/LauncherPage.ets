import CommonConstants from "../common/constants/CommonConstants"
import { preferences } from "@kit.ArkData"
import Logger from "../common/utils/Logger"
import { GlobalContext } from "../common/utils/GlobalContext"
import CustomDialogComponent from "../view/CustomDialogComponent";
import { common } from "@kit.AbilityKit";
import { router } from "@kit.ArkUI";
import { JSON } from "@kit.ArkTS";

const IS_JUMP_PRIVACY_KEY: string = 'isJumpPrivacy';

@Entry
@Component
struct LauncherPage {
  private context?: common.UIAbilityContext;
  private timerId: number = 0;
  private isJumpToAdvertising: boolean = false;

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogComponent({
      cancel: () => {
        this.onCancel();
      },
      confirm: () => {
        this.onConfirm();
      }
    }),
    alignment: DialogAlignment.Bottom,
    offset: {dx: 0, dy: CommonConstants.DIALOG_CONTROLLER_DY_OFFSET},
    customStyle: true,
    autoCancel: false,
  });
  onCancel(){
    this.context?.terminateSelf();
  }
  onConfirm(){
    this.saveIsPrivacy();
    this.jumpToAdvertisingPage();
  }

  onPageHide(): void {
    if (this.isJumpToAdvertising){
      router.clear();
    }
    GlobalContext.getContext().setObject(IS_JUMP_PRIVACY_KEY, true);
    clearTimeout(this.timerId);
  }

  jumpToAdvertisingPage() {
    this.timerId = setTimeout(() => {
      this.isJumpToAdvertising = true;
      router.pushUrl({
        url: CommonConstants.ADVERTISING_PAGE_URL
      })
        .catch((error: Error) => {
          Logger.error(CommonConstants.LAUNCHER_PAGE_TAG, 'LauncherPage pushUrl error: '+ JSON.stringify(error))
        })
    }, CommonConstants.LAUNCHER_DELAY_TIME)
  }

  saveIsPrivacy(){
    let preferences: Promise<preferences.Preferences> = this.getDataPreferences(this);
    preferences.then((result: preferences.Preferences) => {
      let privacyPut = result.put(CommonConstants.PREFERENCES_KEY_PRIVACY, false);
      result.flush();
      privacyPut.then(() => {
        Logger.info(CommonConstants.LAUNCHER_PAGE_TAG, 'put successfully')
      }).catch((err: Error) => {
        Logger.error(CommonConstants.LAUNCHER_PAGE_TAG, 'put error: '+ JSON.stringify(err));
      })
    })
      .catch((err: Error) => {
        Logger.error(CommonConstants.LAUNCHER_PAGE_TAG, 'put error: '+ JSON.stringify(err));
      })
  }

  onPageShow() {
    this.context = getContext(this) as common.UIAbilityContext;
    this.getDataPreferences(this).then((preference: preferences.Preferences) => {
      preference.get(CommonConstants.PREFERENCES_KEY_PRIVACY, true)
        .then((value: preferences.ValueType) => {
          Logger.info(CommonConstants.LAUNCHER_PAGE_TAG, 'onPageShow');
          if (value) {
            let isJumpPrivacy: boolean = (GlobalContext.getContext()
              .getObject(IS_JUMP_PRIVACY_KEY) as boolean ?? false);
            if (!isJumpPrivacy) {
              this.dialogController.open();
            } else {
              this.jumpToAdvertisingPage();
            }
          }
        })
    })
  }

  getDataPreferences(common: Object) {
    return preferences.getPreferences(getContext(common), CommonConstants.PREFERENCES_FILE_NAME);
  }

  build() {
    Stack() {
      Image($r('app.media.ic_launcher_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
      Column() {
        Image($r('app.media.ic_logo'))
          .width($r('app.float.launcher_logo_size'))
          .height($r('app.float.launcher_logo_size'))
          .margin({ top: CommonConstants.LAUNCHER_IMAGE_MARGIN_TOP })
        Text($r('app.string.healthy_life_text'))
          .width($r('app.float.launcher_life_text_width'))
          .height($r('app.float.launcher_life_text_height'))
          .healthyLifeTextStyle(FontWeight.Bold,
            CommonConstants.LAUNCHER_LIFE_TEXT_SPACING,
            $r('app.float.launcher_text_title_size'),
            $r('app.color.launcher_text_title_color'))
          .margin({ top: CommonConstants.LAUNCHER_TEXT_TITLE_MARGIN_TOP })
        Text($r('app.string.healthy_life_introduce'))
          .height(CommonConstants.LAUNCHER_TEXT_INTRODUCE_HEIGHT)
          .healthyLifeTextStyle(FontWeight.Normal,
            CommonConstants.LAUNCHER_TEXT_INTRODUCE_SPACING,
            $r('app.float.launcher_text_introduce_size'),
            $r('app.color.launcher_text_introduce_color'))
          .opacity($r('app.float.launcher_text_opacity'))
          .margin({ top: CommonConstants.LAUNCHER_TEXT_INTRODUCE_MARGIN_TOP })
      }
      .height(CommonConstants.FULL_HEIGHT)
      .width(CommonConstants.FULL_WIDTH)
    }
  }
}

@Extend(Text) function healthyLifeTextStyle (fontWeight: number,
  textAttribute: number, fontSize: Resource, fontColor: Resource) {
  .fontWeight(fontWeight)
  .letterSpacing(textAttribute)
  .fontSize(fontSize)
  .fontColor(fontColor)
}