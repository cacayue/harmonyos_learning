import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import PreferencesUtil from '../common/database/PreferencesUtil';
import Logger from '../common/utils/Logger';
import SettingItemComponent from '../view/SettingItemComponent';
import TitleBarComponent from '../view/TitleBarComponent';
import HomeViewModel from '../viewmodel/HomeViewModel';
import SettingData from '../viewmodel/SettingData';
import { router } from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

const TAG = '[HomePage]';

@Entry
@Component
struct HomePage {
  private settingArr = HomeViewModel.initSettingData();
  @State changeFontSize: number = CommonConstants.SET_SIZE_NORMAL;

  onPageShow(): void {
    PreferencesUtil.getChangeFontSize().then((value) => {
      this.changeFontSize = value;
      Logger.info(TAG, `Get the value of changeFontSize: ${this.changeFontSize}`);
    });
  }

  build() {
    Column() {
      TitleBarComponent({ isBack: false, title: $r('app.string.home_title') })
      Row(){
        SettingItemComponent({
          setting: this.settingArr[CommonConstants.DISPLAY_INDEX],
          changeFontSize: this.changeFontSize,
          itemClick: () => {}
        })
      }
      .blockBackground(StyleConstants.BLOCK_TOP_MARGIN_FIRST_PERCENT)
      Row(){
        SettingItemComponent({
          setting: this.settingArr[CommonConstants.VOICE_INDEX],
          changeFontSize: this.changeFontSize,
          itemClick: () => {}
        })
      }
      .blockBackground(StyleConstants.BLOCK_TOP_MARGIN_SECOND_PERCENT)
      Row(){
        this.SettingItem()
      }
      .blockBackground(StyleConstants.SET_CHAT_HEAD_SIZE_PERCENT)
    }
    .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
  }

  @Builder SettingItem() {
    List() {
      ForEach(this.settingArr.slice(CommonConstants.START_INDEX, CommonConstants.END_INDEX),
        (item: SettingData, index?: number) => {
          ListItem() {
            SettingItemComponent({ setting: item, changeFontSize: this.changeFontSize, itemClick: () => {
              if (index === CommonConstants.SET_FONT_INDEX) {
                router.pushUrl({
                  url: CommonConstants.SET_URL
                })
                  .catch((err:Error) => {
                    Logger.info(TAG, `HomePage push error ${JSON.stringify(err)}`);
                  })
              }
            } })
          }
        }, (item: SettingData) => JSON.stringify(item))
    }
    .divider({
      strokeWidth: $r('app.float.setting_item_divider_width'),
      color: $r('app.color.setting_item_divider'),
      startMargin: $r('app.float.setting_item_divider_start_margin'),
      endMargin: StyleConstants.DIVIDER_END_MARGIN_PERCENT
    })
  }
}

@Extend(Row) function blockBackground(marginTop: string) {
  .backgroundColor(Color.White)
  .borderRadius($r('app.float.block_background_radius'))
  .margin({ top: marginTop })
  .width(StyleConstants.BLOCK_WIDTH_PERCENT)
  .padding({ top: $r('app.float.block_vertical_padding'), bottom: $r('app.float.block_vertical_padding')})
}