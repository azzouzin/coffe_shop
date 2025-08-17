import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.child, this.size});
  final Function()? onPressed;
  final Widget? child;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: Theme.of(context).primaryColor,
        padding: child is Text
            ? const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child:
          child ??
          Text(
            AppStrings.getStarted,
            style: Theme.of(context).textTheme.titleSmall,
          ),
    );
  }
}
