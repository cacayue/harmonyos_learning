import CommonConstants from "../common/constants/CommonConstants"

@Entry
@Component
export struct LauncherPage {
  build() {
    Stack() {
      Image($r('app.media.ic_launcher_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
    }
  }
}