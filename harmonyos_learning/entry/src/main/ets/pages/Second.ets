import { router } from '@kit.ArkUI';

class ReferenceType{
  paramString: string = '';
}

@Entry
@Component
struct Parent {
  @State variableValue: string = 'Hello Local Builder';

  @LocalBuilder
  citeLocalBuilder(params: ReferenceType) {
    Row() {
      Text(`Use State Var By Ref: ${params.paramString}`)
    }
  }

  build() {
    Column() {
      this.citeLocalBuilder({ paramString: this.variableValue});
      Button('Click me')
        .onClick(() => {
          this.variableValue = 'Hi world'
        })
      Button("Go to index")
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({url: "pages/Index"});
        })
    }
  }
}