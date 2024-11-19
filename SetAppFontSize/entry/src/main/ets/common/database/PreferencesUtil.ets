import { Context } from "@kit.AbilityKit";
import { preferences } from "@kit.ArkData";
import { GlobalContext } from "../utils/GlobalContext";
import Logger from "../utils/Logger";


const TAG = '[PreferenceUtil]';
const PREFERENCES_NAME = 'myPreferences';
const KEY_APP_FONT_SIZE = 'appFontSize';
const FUNCTION_KEY = 'getFontPreferences';

export class PreferencesUtil {

  createFontPreferences(context: Context){
    let fontPreferences: Function = (() => {
      let localPreferences: Promise<preferences.Preferences> = preferences.getPreferences(context, PREFERENCES_NAME);
      return localPreferences;
    });
    GlobalContext.getContext().setObject(FUNCTION_KEY, fontPreferences);
  }

  saveDefaultFontSize(fontSize: number){
    let getFontPreferences: Function = this.getFontPreferences();
    getFontPreferences().then((preference: preferences.Preferences) => {
      preference.has(KEY_APP_FONT_SIZE).then(async (isExist: boolean) => {
        Logger.info(TAG, `preferences has changeFontSize is ${isExist}`);
        if (!isExist) {
          await preference.put(KEY_APP_FONT_SIZE, fontSize);
          preference.flush();
        }
      })
        .catch((err: Error) => {
          Logger.error(TAG, `Has error --- ${err}`)
        });
    }).catch((err: Error) => {
      Logger.error(TAG, `'Get the preferences failed, err: ${err}`)
    });
  }

  private getFontPreferences(): Function {
    return GlobalContext.getContext().getObject(FUNCTION_KEY) as Function;
  }

  saveChangeFontSize(fontSize: number){
    let getFontPreferences: Function = this.getFontPreferences();
    getFontPreferences().then(async (preference: preferences.Preferences) => {
      await preference.put(KEY_APP_FONT_SIZE, fontSize);
      preference.flush();
    }).catch((err: Error) => {
      Logger.error(TAG, `Has error --- ${err}`)
    });
  }

  async getChangeFontSize(){
    let fontSize: number = 0;
    let getFontPreferences: Function = this.getFontPreferences();
    fontSize = await (await getFontPreferences()).get(KEY_APP_FONT_SIZE, fontSize);
    return fontSize;
  }

  async deleteChangeFontSize() {
    let getFontPreferences: Function = this.getFontPreferences();
    const preference: preferences.Preferences = await getFontPreferences();
    let deleteValue = preference.delete(KEY_APP_FONT_SIZE);
    deleteValue.then(() => {
      Logger.info(TAG, 'Succeeded !')
    })
      .catch((err: Error) => {
        Logger.error(TAG, `Has error --- ${err}`)
      });
  }
}

export default new PreferencesUtil();