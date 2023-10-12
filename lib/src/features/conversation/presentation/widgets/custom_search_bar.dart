import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intime_test/src/core/core.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: DimensionConstants.searchBarVerticalPadding,
          horizontal: DimensionConstants.searchBarHorizontalPadding,
        ),
        suffixIcon: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 24, height: 24),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              CustomIcons.searchIcon,
            ),
          ),
        ),
        fillColor: ColorConstants.colorPrimaryDisabled,
        focusColor: ColorConstants.colorWhite,
        hintText: StringConstants.searchBarHintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(DimensionConstants.searchBarBorderRadius),
        ),
      ),
      onFieldSubmitted: (value) {},
    );
  }
}
