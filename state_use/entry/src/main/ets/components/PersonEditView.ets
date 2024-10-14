import { expect } from '@ohos/hypium'
import { Address, AddressBook, ObservedArray, Person } from '../models/models'
import { phonesNumber } from './phonesNumber'

@Component
export struct PersonEditView {
  @Consume addrBook: AddressBook

  @Link selectedPerson: Person;

  @Prop name: string = "";
  @Prop address: Address = new Address("", 0, "");
  @Prop phones: ObservedArray<string> = [];

  selectPersonIndex(): number {
    return this.addrBook.contacts.findIndex((person: Person) => person.id_ === this.selectedPerson.id_);
  }

  build() {
    Column(){
      TextInput({ text: this.name })
        .onChange((value) => {
          this.name  = value;
        })
      TextInput({text: this.address.street})
        .onChange((value) => {
          this.address.street = value;
        })

      TextInput({text: this.address.city})
        .onChange((value) => {
          this.address.city = value;
        })

      TextInput({text: this.address.zip.toString()})
        .onChange((value) => {
          const result = Number.parseInt(value);
          this.address.zip= Number.isNaN(result) ? 0 : result;
        })

      if (this.phones.length > 0){
        phonesNumber({ phoneNumber: this.phones })
      }

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween}){
        Text("Save Changes")
          .onClick(() => {
            this.selectedPerson.name = this.name;
            this.selectedPerson.address = new Address(this.address.street, this.address.zip, this.address.city);
            this.phones.forEach((phone: string, index: number)=> {
              this.selectedPerson.phones[index] = phone;
            })
          })
        if (this.selectPersonIndex() != -1){
          Text("Delete Contact")
            .onClick(() => {
              let index = this.selectPersonIndex();
              this.addrBook.contacts.splice(index, 1);
              index = (index < this.addrBook.contacts.length) ? index: index -1;
              this.selectedPerson = (index >= 0) ? this.addrBook.contacts[index] : this.addrBook.me;
            })
        }
      }
    }
  }
}