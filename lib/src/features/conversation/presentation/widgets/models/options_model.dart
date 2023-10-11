import 'package:flutter/widgets.dart';

class OptionsModel {
  const OptionsModel({
    required this.title,
    this.leading,
    this.trailing,
    this.isActive = false,
  });
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final bool isActive;
}
