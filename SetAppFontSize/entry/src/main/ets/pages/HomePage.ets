import CommonConstants from '../common/constants/CommonConstants';
import PreferenceUtil from '../common/database/PreferencesUtil';
import Logger from '../common/utils/Logger';

const TAG = '[HomePage]';

@Entry
@Component
struct HomePage {
  @State changeFontSize: number = CommonConstants.SET_SIZE_NORMAL;

  onPageShow(): void {
    PreferenceUtil.getChangeFontSize().then((value) => {
      this.changeFontSize = value;
      Logger.info(TAG, `Get the value of changeFontSize: ${this.changeFontSize}`);
    });
  }

  build() {

  }
}