import Fruit from '../viewmodel/Fruit'
import { preferences } from '@kit.ArkData';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import { promptAction } from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

let context = getContext(this);
let preference: preferences.Preferences;
let preferenceTemp: preferences.Preferences;

class PreferenceModel {
  private fruitData: Fruit = new Fruit();

  async getPreferencesFromStorage() {
    try {
      preference = await preferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    }
    catch (err) {
      Logger.error(err);
    }
  }

  async deletePreference() {
    try {
      await preferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to delete preferences, Cause: ${err}`)
    }
    preference = preferenceTemp;
    this.showToastMessage($r('app.string.delete_success_msg'));
  }

  async putPreference(fruit: Fruit){
    if (!preference){
      await this.getPreferencesFromStorage();
    }
    try {
      await preference.put(CommonConstants.KEY_NAME, JSON.stringify(fruit));
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to put preferences, Cause: ${err}`)
    }
    await preference.flush();
  }

  async getPreference(): Promise<Fruit> {
    let fruit = '';
    if (!preference){
      await this.getPreferencesFromStorage();
    }
    try {
      fruit = (await preference.get(CommonConstants.KEY_NAME, '')).toString();
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get preferences, Cause: ${err}`)
    }

    if (fruit === '' ){
      this.showToastMessage($r('app.string.data_is_null_msg'));
    }
    this.showToastMessage($r('app.string.read_success_msg'));
    return JSON.parse(fruit) as Fruit;
  }

  async getFruitData() {
    this.fruitData = await this.getPreference();
    return this.fruitData;
  }

  checkFruitData(fruit: Fruit){
    if (fruit.fruitName === '' || fruit.fruitNum === '') {
      this.showToastMessage($r('app.string.fruit_input_null_msg'))
      return true;
    }
    return false ;
  }

  writeData(fruit: Fruit) {
    let isDataNull = this.checkFruitData(fruit);
    if (isDataNull) {
      return;
    }
    this.putPreference(fruit);
    this.showToastMessage($r('app.string.write_success_msg'))
  }


  /**
   * Popup window prompt message.
   *
   * @param message Prompt message.
   */
  showToastMessage(message: Resource) {
    promptAction.showToast({
      message: message,
      duration: CommonConstants.DURATION
    });
  };
}

export default new PreferenceModel();