void main(List<String> arguments) {
  
}

abstract class Thing {
  String name;
  int age;
  Thing(this.name, this.age);
  String get color;
}

class Chair extends Thing {
  Chair(String name, int age) : super(name, age);

  @override
  String get color => 'blue';
}

/*
void main(List<String> arguments) {
  var point = Point.zero()
    ..x = 33
    ..y = 45;
  
  print(point.toString());
}


class Point{
  final String name;
  int x = 0;
  int y = 0;

  static final Map<String, Point> _cache = <String, Point>{};

  Point(this.x, this.y, {this.name = 'zero'});
  
  Point.zero() : name = 'zero';

  void save() {
    _cache[name] = Point(x, y, name: name);
  }

  int addTogether(){
    return x + y;
  }

  @override
  String toString() => 'Point at ($x, $y) named: $name';

  @override
  bool operator ==(other) => other is Point && other.x == x && other.y == y && other.name == name;

  @override
  int get hashCode => super.hashCode;
} */
