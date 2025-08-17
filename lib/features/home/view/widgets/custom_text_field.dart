import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_paths.dart';
import '../../../../core/theme/light_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: LightThemeConstants.appBarGredients,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search your coffee ...",
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(Assets.search, color: Colors.white),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
      ),
    );
  }
}
