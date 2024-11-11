// ignore_for_file: public_member_api_docs, sort_constructors_first
class Human {
  String name;
  String mobilePhone;
  DateTime birthDate;

  Human({
    required this.name,
    required this.mobilePhone,
    required this.birthDate,
  });

  printAllData() {
    print(name + '  ' + birthDate.toString() + ' ' + mobilePhone);
  }

  getMyAge() {
    print(DateTime.now().difference(birthDate));
  }
}

// ! HomeWork :  Scan All possible Scenrio
class Doctor {
  late String _name;
  String jop;
  Doctor({
    required this.jop,
  });

  String get name => _name;

  set addname(String name) {
    if (name.startsWith(RegExp(r'[A-Z]'))) {
      _name = "Dr." + name;
    } else if (name.contains('Dr')) {
      _name = name;
    } else {
      // throw UnimplementedError();
      throw Exception("The Name is Not Valid Name");
    }
  }
}

class Engineer extends Human {
  String jop;

  Engineer(
      {required this.jop,
      required super.mobilePhone,
      required super.birthDate,
      required super.name});

  scream() {
    print("WOW !! It's Work");
  }

  // ? add spaces between words of print
  @override
  printAllData() {
    print(jop + super.mobilePhone + super.name + super.birthDate.toString());
  }
}

abstract class Animal {
  sound();
}

class Dog extends Animal {
  @override
  sound() {
    print("HowHow");
  }
}

class Cat extends Animal {
  @override
  sound() {
    print("Mewo Moew");
  }
}
