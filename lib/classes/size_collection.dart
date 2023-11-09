import 'package:flutter/widgets.dart';

class SizeCollection {
  final BuildContext context;

  SizeCollection(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
}
