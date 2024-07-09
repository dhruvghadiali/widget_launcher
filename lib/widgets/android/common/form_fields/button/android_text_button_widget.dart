import 'package:flutter/material.dart';

class AndroidTextButtonWidget extends StatelessWidget {
  const AndroidTextButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  final String buttonText;
  final Color? backgroundColor;
  final Color? textColor;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.secondary,
        shadowColor: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 18)
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: textColor ?? Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
