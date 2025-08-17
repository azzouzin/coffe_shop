import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/assets_paths.dart';
import '../../../../core/theme/light_theme.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class AppBarContenet extends StatelessWidget {
  const AppBarContenet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row with Avatar + Greeting
          Row(
            children: [
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Setif, Algeria 🇩🇿",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Color.fromARGB(255, 249, 249, 249),
                                ),
                          ),
                          Gap(5),
                          SvgPicture.asset(
                            Assets.arrowRight2,
                            color: Colors.white,
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Gap(16),
          // Custom Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: LightThemeConstants.appBarGredients,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search your coffee...",
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
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
                ),
              ),
              Gap(8),
              CustomIconButton(
                size: Size(40, 45),
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.filter,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
