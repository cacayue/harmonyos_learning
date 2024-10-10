import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button("Go to Second")
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({url: "pages/Second"});
        })
      Button("Go to Third")
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({url: "pages/Third"});
        })
      Button("Go to Fourth")
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({url: "pages/Fourth"});
        })
    }
    .height('100%')
    .width('100%')
  }
}