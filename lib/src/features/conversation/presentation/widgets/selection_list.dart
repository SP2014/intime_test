import 'package:flutter/widgets.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/custom_chip.dart';
import 'package:intime_test/src/features/conversation/presentation/widgets/models/options_model.dart';

class SelectionList extends StatelessWidget {
  const SelectionList({
    super.key,
    required this.options,
    required this.onOptionClicked,
  });
  final List<OptionsModel> options;
  final Function(OptionsModel) onOptionClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: options.length,
        itemBuilder: (ctx, idx) => Container(
          margin: const EdgeInsets.only(
            right: 18,
          ),
          child: CustomChip(
            leading: options[idx].leading,
            trailing: options[idx].trailing,
            text: options[idx].title,
            isActive: options[idx].isActive,
            onClick: () => onOptionClicked(
              options[idx],
            ),
          ),
        ),
      ),
    );
  }
}
