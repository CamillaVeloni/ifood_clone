import 'package:flutter/material.dart';

enum IconAlignment {
  left,
  right,
}

class FilterButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool hasIcon;
  final IconAlignment alignment;
  final IconData? icon;

  FilterButton({
    Key? key,
    required this.title,
    this.hasIcon = true,
    this.alignment = IconAlignment.right,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  final buttonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.grey.shade200),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    )
  );
  final textStyle = TextStyle(color: Colors.grey.shade700, fontSize: 16);

  Widget filterIconButton() {
    final isAlignmentOnRight = alignment == IconAlignment.right;

    return isAlignmentOnRight
        ? OutlinedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: textStyle,
                ),
                const SizedBox(width: 3),
                Icon(icon, color: Colors.grey.shade700, size: 18),
              ],
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            label: Text(title, style: textStyle),
            icon: Icon(icon, color: Colors.grey.shade700, ),
            style: buttonStyle,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: hasIcon
          ? filterIconButton()
          : OutlinedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(title, style: textStyle),
            ),
    );
  }
}
