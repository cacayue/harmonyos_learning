// 自定义组件使用自定义函数
import { buildButton, goToIndex } from '../commonablility/CommonAbility';

@Entry
@Component
struct PrivateBuilder {
  @State builder_value: string = 'Hello';

  @Builder builder(){
    Column(){
      Text(this.builder_value)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }

  aboutToAppear(): void {
    setTimeout(() => {
      this.builder_value = 'Hello World';
    }, 3000)
  }

  build() {
    Row(){
      Column() {
        Text(this.builder_value)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Blank()
        this.builder()
        buildButton("点击改变Builder——value", () => {
          this.builder_value = "builder_value 被点击"
        })
        buildButton("backIndex", () => {
          goToIndex()
        })
      }
    }
  }
}