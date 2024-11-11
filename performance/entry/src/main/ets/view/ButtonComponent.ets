import StyleConstants from "../common/constants/StyleConstants";
import PreferenceModel from "../model/PreferenceModel";
import ButtonItemData from "../viewmodel/ButtonItemData"
import Fruit from "../viewmodel/Fruit"

@Component
export default  struct  ButtonComponent {
  private buttonItemValues: Array<ButtonItemData> = this.getButtonItemValues();

  @Link fruit: Fruit;

  getButtonItemValues(): Array<ButtonItemData> {
    let values: Array<ButtonItemData> = [
      new ButtonItemData(
        $r('app.string.write_data_btn_text'),
        () => {
          PreferenceModel.writeData(this.fruit);
        }
      ),
      new ButtonItemData(
        $r('app.string.read_data_btn_text'),
        () => {
          PreferenceModel.getFruitData().then((resultData: Fruit) => {
            if (resultData) {
              this.fruit = resultData;
            }
          });
        }
      ),
      new ButtonItemData(
        $r('app.string.delete_data_file_btn_text'),
        () => {
          PreferenceModel.deletePreference();
          this.fruit.fruitName = ''
          this.fruit.fruitNum = ''
        }
      )
    ];

    return values;
  }

  build() {
    Column() {
      ForEach(this.buttonItemValues, (item: ButtonItemData) => {
        Button(item.resource, { type: ButtonType.Capsule, stateEffect: true})
          .backgroundColor($r('app.color.button_background_color'))
          .width(StyleConstants.BUTTON_WIDTH)
          .height(StyleConstants.BUTTON_HEIGHT)
          .fontWeight(StyleConstants.FONT_WEIGHT)
          .fontSize(StyleConstants.FONT_SIZE)
          .margin({ bottom: StyleConstants.BUTTON_MARGIN_BOTTOM })
          .onClick(() => {
            item.clickMethod();
          })
      }, (item: ButtonItemData) => JSON.stringify(item))
    }
  }
}