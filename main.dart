import 'dart:io';

int addTwoNumber(int firstNumber, int secondNumber) {
  int result = firstNumber + secondNumber;
  return result;
}

int addTwoOrThreeNumber(int firstNumber, int secondNumber,
    {int thirdNumber = 0}) {
  int result = firstNumber + secondNumber + thirdNumber;
  return result;
}

int addThreeNumber({
  required int firstNumber,
  required int secondNumber,
  required int thirdNumber,
}) {
  int result = firstNumber + secondNumber + thirdNumber;
  return result;
}

int result = 0;

void addThreeNumberAndVoid({
  required int firstNumber,
  required int secondNumber,
  required int thirdNumber,
}) {
  firstNumber++;

  result = firstNumber + secondNumber + thirdNumber;
  print(result);
}

scanner(String name) {
  print("Dr . ${name}");
  return name;
}

int hello(bool isFav) {
  if (isFav) {
    return 10;
  } else {
    throw Exception("HEllo Wolrd");
  }
}

void main(List<String> args) {
  print(
    addTwoNumber(
      3,
      5,
    ),
  );

  print(
    addTwoOrThreeNumber(
      3,
      5,
      thirdNumber: 10,
    ),
  );

  print(addThreeNumber(
    firstNumber: 10,
    secondNumber: 10,
    thirdNumber: 9,
  ));

  addThreeNumberAndVoid(
    firstNumber: 10,
    secondNumber: 10,
    thirdNumber: 10,
  );
  // ! 30 or 0 ? :
  print(result);

  print(scanner("Abd"));
  dynamic data;
  try {
    data = hello(false);
  } catch (e) {
    print(e);
  }

   // ! Bug vs Exception vs Failed vs Failure and Error // 
}
