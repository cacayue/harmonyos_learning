import { ObservedArray } from '../models/models'

@Component
export struct phonesNumber {
  @ObjectLink phoneNumber: ObservedArray<string>;

  build() {
    Column() {
      ForEach(this.phoneNumber, (phone: ResourceStr, index?: number) => {
          TextInput({ text: phone })
            .width(150)
            .onChange((value) => {
              this.phoneNumber[index!] = value;
            })
        },
        (phone: ResourceStr, index?:number) => `${this.phoneNumber[index!] + index}`)
    }
  }
}
