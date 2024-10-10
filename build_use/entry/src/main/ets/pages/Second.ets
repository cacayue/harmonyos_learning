import { buildButton, goToIndex, overBuilder } from '../commonablility/CommonAbility';

@Entry
@Component
struct Parent{
  @State label: string = "Hello";
  build() {
    Column() {
      overBuilder({paramA1: this.label})
      buildButton("click", () => {
        this.label = "ArkUI";
      })
      buildButton("backIndex", () => {
        goToIndex()
      })
    }
  }
}