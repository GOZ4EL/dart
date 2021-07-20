import 'dart:async';

void main(List<String> arguments) {
  loadString("Hello from dart").then((s) => print(s));
}

Future<String> loadString(String str) {
  return Future.delayed(Duration(seconds: 1)).then((_) {
    return "String: $str";
  });
}
