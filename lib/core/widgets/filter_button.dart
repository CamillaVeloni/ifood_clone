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
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Widget? icon;

  FilterButton({
    Key? key,
    required this.title,
    this.hasIcon = true,
    this.alignment = IconAlignment.right,
    required this.onPressed,
    this.icon, this.buttonStyle, this.textStyle,
  }) : super(key: key);

  final fButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.grey.shade200),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    )
  );

  final fTextStyle = TextStyle(color: Colors.grey.shade800, fontSize: 16);

  Widget filterIconButton() {
    final isAlignmentOnRight = alignment == IconAlignment.right;

    return isAlignmentOnRight
        ? OutlinedButton(
            onPressed: onPressed,
            style: buttonStyle ?? fButtonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: textStyle ?? fTextStyle,
                ),
                const SizedBox(width: 3),
                icon!,
              ],
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            label: Text(title, style: textStyle ?? fTextStyle),
            icon: icon!,
            style: buttonStyle ?? fButtonStyle,
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
              style: buttonStyle ?? fButtonStyle,
              child: Text(title, style: textStyle ?? fTextStyle),
            ),
    );
  }
}
