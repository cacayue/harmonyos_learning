import CommonConstants from '../common/constants/CommonConstants';
import { router } from '@kit.ArkUI';
import Logger from '../common/utils/Logger';

@Entry
@Component
struct AdvertisingPage {
  @State countDownSeconds: number = CommonConstants.ADVERTISING_COUNT_DOWN_SECONDS;
  private timeId: number = 0;

  onPageShow(): void {
    this.timeId = setInterval(() => {
      if (this.countDownSeconds == 0) {
        this.jumpToAppHomePage();
      }else {
        this.countDownSeconds--;
      }
    }, CommonConstants.ADVERTISING_INTERVAL_TIME)
  }

  onPageHide(): void {
    router.clear();
    clearInterval(this.timeId);
  }

  jumpToAppHomePage() {
    router.pushUrl({
      url: CommonConstants.APP_HOME_PAGE_URL
    })
      .catch((error: Error) => {
        Logger.error(CommonConstants.ADVERTISING_PAGE_TAG, 'AdvertisingPage pushUrl error'+ JSON.stringify(error));
      })
  }

  build() {
    Stack({ alignContent: Alignment.Top}) {
      Image($r('app.media.ic_advertising_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
      Text($r('app.string.advertising_text_title', this.countDownSeconds))
        .fontColor(Color.White)
        .fontSize($r('app.float.advertising_text_title_size'))
        .letterSpacing(CommonConstants.ADVERTISING_TITLE_TEXT_LETTER_SPACING)
        .backgroundColor($r('app.color.advertising_text_title_color'))
        .border({
          radius: $r('app.float.advertising_text_radius'),
          width: $r('app.float.advertising_text_border_width'),
          color: Color.White
        })
        .margin({
          top: $r('app.float.advertising_title_text_margin_top'),
          left: $r('app.float.advertising_title_text_margin_left')
        })
        .padding({
          left: $r('app.float.advertising_text_padding_left'),
          right: $r('app.float.advertising_text_padding_right'),
          top: $r('app.float.advertising_text_padding_top'),
          bottom: $r('app.float.advertising_text_padding_bottom')
        })
        .onClick(() => {
          this.jumpToAppHomePage();
        })
      Row() {
        Image($r('app.media.ic_logo'))
          .width($r('app.float.advertising_image_width'))
          .height($r('app.float.advertising_image_height'))
          .margin({ bottom: CommonConstants.ADVERTISING_ROW_MARGIN_BOTTOM })
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }
}