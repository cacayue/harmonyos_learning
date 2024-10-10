import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Page {
  @State textColor: Color = Color.Black;
  @State num: number = 0;

  onPageShow(): void {
    this.num = 5;
  }

  onPageHide(): void {
    console.log('page onPageHide');
  }

  onBackPress(): boolean | void {
    this.textColor = Color.Gray;
    this.num = 0;
  }

  aboutToAppear(): void {
    this.textColor = Color.Blue;
  }

  build() {
    Column() {
      Text(`num: ${this.num}`)
        .fontSize(30)
        .fontColor(this.textColor)
        .margin(20)
        .onClick(() => {
          this.num += 5;
        })
      Button('back index')
        .fontSize(30)
        .margin(20)
        .onClick(() => {
          router.pushUrl({ url: "pages/Index"}).then(() => {
            console.info('Jumping')
          }).catch((err: BusinessError) => {
            console.error(err.message);
          })
        })
    }
    .width('100%')
  }

}