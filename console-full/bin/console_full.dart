import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
//  loadString("Hello from dart").then((s) => print(s));

//  var str = await loadString("Hello from dart async");
//  print(str);


//  var x = await addAsync(59);
//  var z = await x(40);
//  print(z);

//  Stream stream = exampleStream(20);
//  await for(var s in stream) {
//    print("Number: $s");
//  }

//  exampleStream(20).listen((int x) => print("Number: $x"));

  var file = File("text.txt");
  var sink = file.openWrite(mode: FileMode.append);
  sink.add(utf8.encode("Hello from dart at ${DateTime.now().toIso8601String()}\n"));

  await sink.flush();
  await sink.close();

  var fileStream = file.openRead().asBroadcastStream();

  fileStream
    .transform(utf8.decoder)
    .transform(LineSplitter())
    .listen((str) => print(str),
      onDone: () => print("Done reading file"),
      onError: (e) => print(e.toString())
    )
  ;

  fileStream.listen((byte) => print(byte)); 
}

//Stream<int> exampleStream(int x) async* {
//  for(var i = 0; i <= x; i++) {
//    yield i;
//  }
//}  
//Future<String> loadString(String str) async {
//  await Future.delayed(Duration(seconds: 1));
//  return "String: $str";
//}

//Future<Function> addAsync(int x) async {
//  return (int y) async => x + y;
//}

//Future<String> loadString(String str) {
//  return Future.delayed(Duration(seconds: 1)).then((_) {
//    return "String: $str";
//  });
//}
