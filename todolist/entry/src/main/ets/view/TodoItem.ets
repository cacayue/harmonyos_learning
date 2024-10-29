
@Extend(Text) function completeText(isComplete: boolean) {
  .opacity(isComplete ? 0.7 : 1)
    .decoration({
      type: isComplete ? TextDecorationType.LineThrough :
      TextDecorationType.None
    })
}

@Component
export struct TodoItem {
  @State isComplete: boolean = false;
  private contact: string = '';


  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      if (!this.isComplete) {
        this.labelIcon($r('app.media.ic_default'))
      } else {
        this.labelIcon($r('app.media.ic_ok'))
      }
      Text(this.contact)
        .completeText(this.isComplete)
    }
    .borderRadius(24)
    .backgroundColor($r('app.color.start_window_background'))
    .width('90.5%')
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.isComplete = !this.isComplete;
    })
  }
}