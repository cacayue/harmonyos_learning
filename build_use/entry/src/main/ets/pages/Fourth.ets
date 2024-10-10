import { buildButton, goToIndex, indexButton, Tmp } from '../commonablility/CommonAbility'

@Component
struct HelloComponent{
  @Prop message: string = ""

  build() {
    Row() {
      Text(`HelloComponent === ${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Component
struct HelloChildComponent{
  @Prop message: string = ""

  build() {
    Row() {
      Text(`HelloChildComponent === ${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Component
struct HelloGrandsonComponent{
  @Prop message: string = ""
  build() {
    Row() {
      Text(`HelloGrandsonComponent === ${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Builder
function childBuilder($$: Tmp){
  Row() {
    Column() {
      Text(`childBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloChildComponent({message: $$.paramA1})
      grandsonBuilder({paramA1: $$.paramA1})
    }
  }
}

@Builder
function childBuilder2(message: string){
  Row() {
    Column() {
      Text(`childBuilder2===${message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloChildComponent({message: message})
      grandsonBuilder({paramA1: message})
    }
  }
}

@Builder
function grandsonBuilder($$: Tmp){
  Row() {
    Column() {
      Text(`grandsonBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloGrandsonComponent({message: $$.paramA1})
    }
  }
}




@Builder function  parentBuilder($$: Tmp){
  Row() {
    Column() {
      Text(`parentBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()
      HelloComponent({message: $$.paramA1})
      Blank()
      // $$引用传递
      childBuilder({paramA1: $$.paramA1})
      Blank()
      // 值传递
      childBuilder2($$.paramA1)
    }
  }
}

@Entry
@Component
struct fourthComponent{
  @State label: string = "Hello";

  build() {
    Column() {
      parentBuilder({paramA1: this.label})
      buildButton('Click me', () => {
        this.label = "ArkUI";
      })
      indexButton()
    }
  }
}