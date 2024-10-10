@Component
struct ChildPage {
  @State label: string = `Child Page`;
  @Builder customBuilder() {};
  @BuilderParam customChangeThisBuilderParam: () => void = this.customBuilder;

  build() {
    Column() {
      this.customChangeThisBuilderParam()
    }
  }
}

@Entry
@Component
struct ParentPage {
  @State label: string = `Parent Page`;

  @Builder componentBuilder() {
    Row(){
      Text(`Builder :${this.label}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
  }

  build() {
    Column() {
      ChildPage({
        customChangeThisBuilderParam: () => { this.componentBuilder() }
      })
      Button('点击改变label内容')
        .onClick(() => {
          this.label = 'Hello World';
        })
    }
  }
}