@Styles function globalFancy() {
  .width(150)
  .height(100)
  .backgroundColor(Color.Pink)
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State heightValue: number = 100;

  @Styles fancy() {
    .width(200)
    .height(this.heightValue)
    .backgroundColor(Color.Yellow)
    .onClick(() => {
      this.heightValue = 200;
    })
  }

  build() {
    Column() {
      // 使用全局
      Text('A')
        .globalFancy()
        .fontSize(30)
      // 使用本地
      Text('B')
        .fancy()
        .fontSize(30)
    }
    .height('100%')
    .width('100%')
  }
}