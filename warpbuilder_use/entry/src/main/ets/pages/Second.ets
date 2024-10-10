@Builder
function MyBuilder(value: string, size: number){
  Text(value + 'MyBuilder')
    .fontSize(size)
}

@Builder
function YourBuilder(value: string, size: number){
  Text(value + 'YourBuilder')
    .fontSize(size)
    .fontColor(Color.Blue)
}

const builderArr: WrappedBuilder<[string, number]>[] = [wrapBuilder(MyBuilder), wrapBuilder(YourBuilder)];

@Entry
@Component
struct Second {
  @Builder testBuilder() {
    ForEach(builderArr, (item: WrappedBuilder<[string, number]>) => {
      item.builder('Hello World', 30)
    })
  }

  build() {
    Row() {
      Column() {
        this.testBuilder()
      }
      .width('`100%')
    }
    .height('100%')
  }
}