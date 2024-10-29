import { TodoItem } from '../view/TodoItem'

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
    Column() {
      Text('待办')
        .fontSize(24)
        .fontWeight(FontWeight.Bolder)
      ForEach(this.items, (item: string) => {
        TodoItem({ contact: item })
      })
    }
  }
}