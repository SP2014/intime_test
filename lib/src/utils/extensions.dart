import 'package:flutter/widgets.dart';

extension SizeExtension on num {
  Widget hgap() => SizedBox(height: toDouble());
  Widget vgap() => SizedBox(width: toDouble());
}
