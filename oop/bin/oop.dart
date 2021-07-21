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
  int get hashCode => super.hashCode;
}
