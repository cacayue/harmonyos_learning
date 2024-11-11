import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import PreferenceModel from '../model/PreferenceModel';
import ButtonComponent from '../view/ButtonComponent';
import TextItemComponent from '../view/TextItemComponent';
import Fruit from '../viewmodel/Fruit';

@Entry
@Component
struct Index {
  @State fruit: Fruit = new Fruit();

  build() {
    Column() {
      TextItemComponent({
        textResource: $r('app.string.fruit_text'),
        placeholderResource: $r('app.string.fruit_placeholder'),
        textFlag: CommonConstants.FRUIT_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitName = value;
        }
      })
      TextItemComponent({
        textResource: $r('app.string.number_text'),
        placeholderResource: $r('app.string.number_placeholder'),
        textFlag: CommonConstants.NUMBER_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitNum = value;
        }
      })
      ButtonComponent({ fruit: $fruit })
    }
    .width(StyleConstants.FULL_PERCENT)
    .height(StyleConstants.FULL_PERCENT)
    .backgroundColor($r('app.color.main_background_color'))
  }

  async aboutToAppear() {
    await PreferenceModel.getPreferencesFromStorage();
    PreferenceModel.getFruitData().then((resultData: Fruit) => {
      if (resultData) {
        this.fruit = resultData;
      }
    })
  }
}