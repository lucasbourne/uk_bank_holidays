import 'package:collection/collection.dart';

enum Divisions {
  englandAndWales('england-and-wales'),
  scotland('scotland'),
  northernIreland('northern-ireland');

  const Divisions(this.handle);

  final String handle;

  factory Divisions.fromHandle(String handle) {
    final match = Divisions.values.singleWhereOrNull(
      (division) => division.handle == handle,
    );

    return match ?? Divisions.values.first;
  }
}
