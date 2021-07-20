import 'dart:async';

void main(List<String> arguments) async {
//  loadString("Hello from dart").then((s) => print(s));
  String str = await loadString("Hello from dart async");
  print(str);
}

Future<String> loadString(String str) async {
  await Future.delayed(Duration(seconds: 1));
  return "String: $str";
}

//Future<String> loadString(String str) {
//  return Future.delayed(Duration(seconds: 1)).then((_) {
//    return "String: $str";
//  });
//}
