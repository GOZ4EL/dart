import 'dart:async';

void main(List<String> arguments) async {
//  loadString("Hello from dart").then((s) => print(s));

  var str = await loadString("Hello from dart async");
  print(str);


  var x = await addAsync(59);
  var z = await x(40);
  print(z);
}

Future<String> loadString(String str) async {
  await Future.delayed(Duration(seconds: 1));
  return "String: $str";
}

Future<Function> addAsync(int x) async {
  return (int y) async => x + y;
}

//Future<String> loadString(String str) {
//  return Future.delayed(Duration(seconds: 1)).then((_) {
//    return "String: $str";
//  });
//}
