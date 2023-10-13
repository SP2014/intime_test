import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intime_test/src/core/core.dart';

class CustomChip extends HookWidget {
  const CustomChip({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.onClick,
    this.isActive = true,
  });
  final Widget? leading;
  final Widget? trailing;
  final String text;
  final bool isActive;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    //final active = useState(isActive);
    return Material(
      borderRadius: BorderRadius.circular(DimensionConstants.chipBorderRadius),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(DimensionConstants.chipBorderRadius),
        onTap: onClick != null
            ? () {
                //active.value = !active.value;
                onClick!();
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(DimensionConstants.chipBorderRadius),
            color: isActive
                ? ColorConstants.colorPrimary
                : ColorConstants.colorPrimaryDisabled,
          ),
          padding: EdgeInsets.symmetric(
            vertical: DimensionConstants.chipVerticalPadding,
            horizontal: DimensionConstants.chipHorizontalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              leading ?? const SizedBox.shrink(),
              leading != null
                  ? const SizedBox(
                      width: 10,
                    )
                  : const SizedBox.shrink(),
              Text(
                text,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 15,
                  color: isActive
                      ? ColorConstants.colorWhite
                      : ColorConstants.colorPurple,
                ),
              ),
              trailing != null
                  ? const SizedBox(
                      width: 10,
                    )
                  : const SizedBox.shrink(),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
