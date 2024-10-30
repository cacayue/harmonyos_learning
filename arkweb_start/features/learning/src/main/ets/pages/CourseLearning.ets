import { webview } from '@kit.ArkWeb'

@Component
export struct CourseLearning {
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    Web({ src:$rawfile('course_learning/index.html'), controller: this.webviewController })
      .domStorageAccess(true)
  }
}