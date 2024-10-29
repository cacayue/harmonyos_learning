import { TodoItem } from '../view/TodoItem'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct TodoListPage {
  items: Array<string> = [
    'test 1',
    'test 2',
    'test 3',
    'test 4',
  ]

  build() {
    Column({ space: 16 }) {
      Text('待办')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({
          top: 10,
        })
        .textAlign(TextAlign.Start)
      ForEach(this.items, (item: string, index: number) => {
        TodoItem({ contact: item })
      }, (item: string) => item.toString())
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}