import CommonConstants from "../common/constants/CommonConstants"
import { preferences } from "@kit.ArkData"
import Logger from "../common/utils/Logger"
import { GlobalContext } from "../common/utils/GlobalContext"

@Entry
@Component
export struct LauncherPage {

  onPageShow() {
    this.getDataPreferences(this).then((preference: preferences.Preferences) => {
      preference.get(CommonConstants.PREFERENCES_KEY_PRIVACY, true)
        .then((value: preferences.ValueType) => {
          Logger.info(CommonConstants.LAUNCHER_PAGE_TAG, 'onPageShow');
          if (value) {
            let isJumpPrivacy: boolean = (GlobalContext.getContext()
              .getObject('isJumpPrivacy') as boolean ?? false);
            if (!isJumpPrivacy) {
            } else {

            }
          }
        })
    })
  }

  getDataPreferences(common: Object) {
    return preferences.getPreferences(getContext(common), CommonConstants.PREFERENCES_FILE_NAME);
  }

  build() {
    Stack() {
      Image($r('app.media.ic_launcher_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
    }
  }
}