import 'package:flutter/widgets.dart';
import 'package:intime_test/src/core/core.dart';

class CounterPill extends StatelessWidget {
  const CounterPill({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(DimensionConstants.counterPillBorderRadius),
          color: ColorConstants.colorChipAccent),
      padding: EdgeInsets.symmetric(
        vertical: DimensionConstants.counterPillVerticalPadding,
        horizontal: DimensionConstants.counterPillHorizontalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ColorConstants.colorBlack,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
