import { router } from '@kit.ArkUI';

@Component
struct Child {
  label: string = `Child`;
  @Builder customChangeThisBuilder() {};
  @BuilderParam customBuildParam: () => void;
  @BuilderParam customChangeThisBuilderParam: () => void = this.customChangeThisBuilder;

  build() {
    Column() {
      this.customBuildParam()
      this.customChangeThisBuilderParam();
    }
  }
}

@Entry
@Component
struct Parent {
  label: string = `Parent`;

  @Builder componentBuilder() {
    Text(`${this.label}`)
  }

  @LocalBuilder componentBuilderLocal() {
    Text(`${this.label}`)
  }

  build() {
    Column() {
      // this实际指向为Child组件,第二个参数this指向Parent
      Child({ customBuildParam: this.componentBuilder, customChangeThisBuilderParam: this.componentBuilder })
      Line()
        .width(`100%`)
        .height(10)
        .backgroundColor($r('sys.color.black')).margin(10)
      Child({ customBuildParam: this.componentBuilder, customChangeThisBuilderParam: ():void => { this.componentBuilder() } })
      Line()
        .width(`100%`)
        .height(10)
        .backgroundColor($r('sys.color.black')).margin(10)
      // this实际指向为Parent组件,第二个参数this指向Parent
      Child({ customBuildParam: this.componentBuilderLocal, customChangeThisBuilderParam: ():void => { this.componentBuilderLocal() } })
      Line()
        .width(`100%`)
        .height(10)
        .backgroundColor($r('sys.color.black')).margin(10)
      Button("Change Label")
        .fontSize(30)
        .onClick(() => {
          // 修改Label不生效， 因为没有@State监听
          this.label = "Hello label"
        })
      Button("Go to index")
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({url: "pages/Index"});
        })
    }
  }
}