import 'package:collection/collection.dart';

class RRpoint {
  final double x;
  final double y;
  RRpoint({required this.x, required this.y});
}

List<RRpoint> get RRpoints {
  final data = <double>[2,4,6,11,3,6,4];
  return data
      .mapIndexed(
          ((index, element)=>RRpoint(x:index.toDouble(), y: element)))
      .toList();
}