import { router } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct Index {
  @State showChild: boolean = true;
  @State btnColor: string = "#FF007DFF";

  onPageShow(): void {
    console.info("Index onPageShow");
  }

  onPageHide(): void {
    console.info("index onPageHide");
  }

  onBackPress(): boolean | void {
    console.info("index onBackPress");
    this.btnColor = "#FFEE0606";
    return true;
  }
  aboutToAppear() {
    console.info('MyComponent aboutToAppear');
  }

  onDidBuild() {
    console.info('MyComponent onDidBuild');
  }

  aboutToDisappear() {
    console.info('MyComponent aboutToDisappear');
  }


  build() {
    Column() {
      if (this.showChild){
        Child();
      }
      Button('delete Child')
        .margin(20)
        .backgroundColor(this.btnColor)
        .onClick(() => {
          this.showChild = false;
      })
      Button('push to next page')
        .onClick(() => {
          router.pushUrl({ url: 'pages/Page' }).then(() => {
            console.info('Jumping')
          }).catch((err: BusinessError) => {
            console.error(err.message);
          })
        })
    }
  }
}

@Component
struct Child {
  @State title: string = "Hello World";
  aboutToDisappear(): void {
    console.info("[lifeCycle] Child aboutToDisappear");
  }

  onDidBuild(): void {
    console.info("[lifeCycle] Child onDidBuild");
  }

  aboutToAppear(): void {
    console.info("[lifeCycle] Child aboutToAppear");
  }

  build() {
    Text(this.title)
      .fontSize(50)
      .margin(20)
      .onClick(() => {
        this.title = 'Hello ArkUI';
      })
  }
}