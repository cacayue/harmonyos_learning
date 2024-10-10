import { BusinessError } from '@kit.BasicServicesKit';
import { buildButton, goToRouter } from '../commonablility/CommonAbility';
import { RouterPath } from '../commonablility/CommonParams';

@Entry
@Component
struct Index {
  @State message: string = 'Hello Build';

  build() {
    Column() {
      Text(this.message)
        .id('Hello Build')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      buildButton("Next to Second", () => {
        goToRouter(RouterPath.Second)
      })
      buildButton("Next to Third", () => {
        goToRouter(RouterPath.Third)
      })
    }
    .height('100%')
    .width('100%')
  }
}