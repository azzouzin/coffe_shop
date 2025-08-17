import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onPressed, this.child, this.size});
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

        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
