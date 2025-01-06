class A {
  someFunction() {
    print("From Implements Interface");
  }
}

// abstract interface class ClassName {}

// abstract mixin class S {}

// interface class C {
//   dodo() {
//     print("object");
//   }
// }

mixin SomeDartConcepts {
  doSomething() {
    print("From With MIXIN");
  }
}

class Father {
  doAnoutherThing() {
    print("From Extends Class");
  }
}

extension someMethods on B {
  finallyDo() {
    print("object");
  }
}

class B extends Father with SomeDartConcepts implements A {
  //! Required Override
  @override
  someFunction() {
    print("From Child");
  }
}

enum NEWTHINGS {
  WAITING,
  DONE,
  INIT,
}


