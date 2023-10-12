import 'package:flutter/widgets.dart';

class ConversationListTile extends StatelessWidget {
  const ConversationListTile({
    super.key,
    this.leading,
    this.trailing,
    this.child,
    this.onClick,
  });
  final Widget? leading;
  final Widget? trailing;
  final Widget? child;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 50),
        child: Row(
          children: [
            leading ?? const SizedBox.shrink(),
            const SizedBox(
              width: 24,
            ),
            child != null ? Expanded(child: child!) : const Spacer(),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
