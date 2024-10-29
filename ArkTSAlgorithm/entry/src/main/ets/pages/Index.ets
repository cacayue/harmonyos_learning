import { CommonConstants } from '../common/constants/CommonConstants';
import { DaffodilsNumberCustomDialog } from '../view/DaffodilsNumberCustomDialog';

@Entry
@Component
struct Index {
  daffodilsNumberCustomDialogController: CustomDialogController | null = new CustomDialogController({
    builder: DaffodilsNumberCustomDialog(),
    alignment: DialogAlignment.Center,
    offset: { dx: CommonConstants.OFFSET_X, dy: CommonConstants.OFFSET_Y }
  });

  build() {
    Column() {
      Text($r('app.string.ArkTS_Development_Case'))
        .width(CommonConstants.PERCENT_NINETY)
        .margin({
          top: $r('app.float.text_margin_top'),
          bottom: $r('app.float.text_margin_bottom'),
          left: $r('app.float.text_margin_left'),
          right: $r('app.float.text_margin_right')
        })
        .font({ size: $r('app.float.text_font_size'), weight: CommonConstants.FONT_WEIGHT_SEVEN_HUNDRED })

      Column() {
        Button($r('app.string.DaffodilsNumber'))
          .width($r("app.float.button_width"))
          .height($r("app.float.button_height"))
          .onClick(() => {
            this.daffodilsNumberCustomDialogController?.open();
          })
      }
      .width(CommonConstants.PERCENT_FULL)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.PERCENT_FULL)
    .height(CommonConstants.PERCENT_FULL)
  }
}