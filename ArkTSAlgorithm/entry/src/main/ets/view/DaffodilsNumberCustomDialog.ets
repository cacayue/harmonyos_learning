import { CommonConstants } from '../common/constants/CommonConstants';
import { daffodilsNumber } from '../common/utils/Method';

@CustomDialog
export struct DaffodilsNumberCustomDialog {
  IsPalindromicStringCustomDialogController?: CustomDialogController;

  build() {
    Column() {
      Column() {
        Text($r('app.string.ArkTS_Development_Case'))
          .height($r('app.float.button_height'))
          .font({ size: $r('sys.float.ohos_id_text_size_headline8') })
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .margin({ top: $r('app.float.dialog_text_margin_top') })
        Text($r('app.string.DaffodilsNumberTitle'))
          .height($r('app.float.button_height'))
          .font({ size: $r('sys.float.ohos_id_text_size_headline8') })
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .margin({ top: $r('app.float.dialog_text_margin_top') })
      }
      .alignItems(HorizontalAlign.Center)
      .width(CommonConstants.PERCENT_FULL)
      .height($r('app.float.dialog_text_height'))

      Text(daffodilsNumber().toString())
        .font({ size: $r('sys.float.ohos_id_text_size_body1') })
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .margin({ top: $r('app.float.dialog_padding') })
    }
    .alignItems(HorizontalAlign.Center)
    .padding({
      left: $r('app.float.dialog_padding'),
      right: $r('app.float.dialog_padding'),
      bottom: $r('app.float.dialog_padding')
    })
  }
}