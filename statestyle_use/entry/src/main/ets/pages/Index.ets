@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @Styles normalStyle() {
    .backgroundColor(Color.Gray)
  }
  @Styles pressedStyle() {
    .backgroundColor(Color.Red)
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .stateStyles({
          normal: this.normalStyle,
          pressed: this.pressedStyle
        })
    }
    .height('100%')
    .width('100%')
  }
}