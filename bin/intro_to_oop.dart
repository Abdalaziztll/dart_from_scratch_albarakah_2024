import 'package:intro_to_oop/intro_to_oop.dart';

talkTheNameOfAnimal(Animal creature) {
  if (creature is Dog) {
    print("it was a Dog");
  } else {
    print("it was a Cat");
  }
}

main() {
  // Human person = Human(
  //   name: "Ahmad",
  //   mobilePhone: "0932938123",
  //   birthDate: DateTime(
  //     1999,
  //   ),
  // );

  // print(person.mobilePhone);

  // print(person.name);

  // person.printAllData();

  // person.getMyAge();

  // Doctor person2 = Doctor(jop: "Dentist");

  // person2.addname = "Noor";
  // print(person2.name);

  // Engineer eng = Engineer(
  //     jop: "IT",
  //     mobilePhone: "0932193021",
  //     birthDate: DateTime(2000),
  //     name: "Hadi");

  // eng.printAllData();

  // Human person3 = Engineer(
  //     jop: "IT",
  //     mobilePhone: "093213213",
  //     birthDate: DateTime(2001),
  //     name: "Rami");

  // print(person3.runtimeType);

  // person3.printAllData();

  talkTheNameOfAnimal(Dog());
}
