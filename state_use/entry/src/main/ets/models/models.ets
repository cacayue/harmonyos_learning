export class AddressBook {
  me: Person;
  contacts: ObservedArray<Person>;

  constructor(me: Person, contacts: Person[]) {
    this.me = me;
    this.contacts = contacts;
  }
}


let nextId = 0;

@Observed
export class Person{
  id_: string;
  name: string;
  address: Address;
  phones: ObservedArray<string>;

  constructor(name: string,
    street:string,
    zip: number,
    city: string,
    phones: string[]) {
    this.id_ = nextId.toString();
    nextId ++;
    this.name = name;
    this.address = new Address(street, zip, city);
    this.phones = phones;
  }
}

@Observed
export class Address{
  street: string;
  zip: number;
  city: string;

  constructor(
    street: string,
    zip: number,
    city: string,
  ) {
    this.street = street;
    this.zip = zip;
    this.city = city;
  }
}

@Observed
export class ObservedArray<T> extends Array<T>{
  constructor(args: T[]) {
    if (args instanceof Array) {
      super(...args);
    }
    else{
      super(args);
    }
  }
}