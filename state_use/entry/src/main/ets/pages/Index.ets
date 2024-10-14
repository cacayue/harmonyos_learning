import { AddressBookView } from '../components/AddressBookView';
import { Address, AddressBook, Person } from '../models/models'

@Entry
@Component
struct Index {
  @Provide addrBook: AddressBook = new AddressBook(
    new Person("Gigi", "Itamerenkatu 9", 180, "Helsinki", ["18*********", "18*********", "18*********"]),
    [
      new Person("Oly", "Itamerenkatu 9", 180, "Helsinki", ["18*********", "18*********"]),
      new Person("Sam", "Itamerenkatu 9", 180, "Helsinki", ["18*********", "18*********"]),
      new Person("Vivi", "Itamerenkatu 9", 180, "Helsinki", ["18*********", "18*********"]),
    ]);

  build() {
    Column() {
      AddressBookView({
        me: this.addrBook.me,
        contacts: this.addrBook.contacts,
        selectedPerson: this.addrBook.me
      })
    }
  }
}