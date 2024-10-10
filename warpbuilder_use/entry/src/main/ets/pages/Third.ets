@Builder
function MyBuilderFirst(value: string, size: number) {
  Text('MyBuilderFirst：' + value)
    .fontSize(size)
}

@Builder
function MyBuilderSecond(value: string, size: number) {
  Text('MyBuilderSecond：' + value)
    .fontSize(size)
}

interface BuilderModel {
  globalBuilder: WrappedBuilder<[string, number]>;
}

@Entry
@Component
struct Third {
  @State message: string = 'Hello World';
  @State builderObj: BuilderModel = { globalBuilder: wrapBuilder(MyBuilderFirst) };

  aboutToAppear(): void {
    setTimeout(() => {
      // 不会生效
      this.builderObj.globalBuilder = wrapBuilder(MyBuilderSecond);
    },1000)
  }

  build() {
    Row() {
      Column() {
        this.builderObj.globalBuilder.builder(this.message, 20)
      }
      .width('100%')
    }
    .height('100%')
  }
}