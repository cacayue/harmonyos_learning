import CommonConstants from "../common/constants/CommonConstants";
import StyleConstants from "../common/constants/StyleConstants";
import Fruit from "../viewmodel/Fruit";

@Preview
@Component
export default struct TextItemComponent {
  private textResource: Resource = $r('app.string.empty');
  private placeholderResource: Resource = $r('app.string.empty')
  private marginBottom: string = '';
  private marginTop: string = '';
  private textInputType: InputType = InputType.Normal;
  private testFlag: number = 0;
  @Link fruit: Fruit;

  private textInputCallBack = (value: string) => {
    
  }
  
  aboutToAppear(): void {
    if (this.testFlag === CommonConstants.FRUIT_FLAG) {
      this.marginTop = StyleConstants.MARGIN_TOP;
      this.marginBottom = StyleConstants.MARGIN_BOTTOM_SMALL;
      this.textInputType = InputType.Normal
    } else {
      this.marginBottom = StyleConstants.MARGIN_BOTTOM_BIG;
      this.textInputType = InputType.Number;
    }
  }

  build() {
    Column() {
      Text(this.textResource)
        .fontSize(StyleConstants.TEXT_FONT_SIZE)
        .height(StyleConstants.TEXT_HEIGHT)
        .width(StyleConstants.FULL_PERCENT)
        .fontColor($r('app.color.text_font_color'))
        .letterSpacing(StyleConstants.LETTER_SPACING)
        .fontWeight(StyleConstants.FONT_WEIGHT)
        .margin({
          bottom: StyleConstants.TEXT_MARGIN_BOTTOM,
          left: StyleConstants.TEXT_MARGIN_LEFT,
          top: this.marginTop
        })
      TextInput({
        placeholder: this.placeholderResource,
        text: this.testFlag === 0 ? this.fruit.fruitName : this.fruit.fruitNum
      })
        .placeholderFont({ size: StyleConstants.FONT_SIZE, weight: StyleConstants.FONT_WEIGHT})
        .placeholderColor($r('app.color.placeholder_color'))
        .caretColor(Color.Blue)
        .type(this.textInputType)
        .height(StyleConstants.TEXT_INPUT_HEIGHT)
        .width(StyleConstants.TEXT_INPUT_WIDTH)
        .margin({ bottom: this.marginBottom})
        .fontSize(StyleConstants.FONT_SIZE)
        .fontColor($r('app.color.text_font_color'))
        .backgroundColor($r('app.color.white'))
        .onChange((value: string) => {
          this.textInputCallBack(value);
        })
    }
  }
}