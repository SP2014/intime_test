import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intime_test/src/core/core.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(DimensionConstants.searchBarBorderRadius),
        color: ColorConstants.colorPrimaryDisabled,
      ),
      padding: EdgeInsets.symmetric(
        vertical: DimensionConstants.searchBarVerticalPadding,
        horizontal: DimensionConstants.searchBarHorizontalPadding,
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: StringConstants.searchBarHintText,
              hintStyle: TextStyle(
                color: ColorConstants.colorPrimaryAlpha30,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(
              width: 24,
              height: 24,
            ),
            child: SvgPicture.asset(
              CustomIcons.searchIcon,
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
