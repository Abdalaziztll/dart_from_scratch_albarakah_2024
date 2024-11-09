Future<String> getData() async {
  await Future.delayed(Duration(seconds: 2));

  return "Hello";
}

Future<void> printAnyThing() async {
  await Future.delayed(Duration(seconds: 5));

  print("object");
}

main() async {
  var name = await getData();
  await printAnyThing();
  print("World");
  print(name);

  final counter;
  // ? Final Can not be used before it assigned
  // print(counter);
  counter = "20";

  // ? Can be set once
  // counter = 20;

  // ? Must be delcarated and Initilized
  const age = 20;

  // age = 30;

  Map<String, dynamic> map = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {"lat": "-37.3159", "lng": "81.1496"}
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  };

  print(map['address']['geo']['lat']);

  print(map.values.elementAt(4).values.elementAt(4).values.elementAt(0));

  Map<String, List<int>> list = {
    "hello": [
      20,
      40,
      50,
    ]
  };
  // ? Why there is an error ( foreach Student )// 
  print(list["hello"][0]);
}
