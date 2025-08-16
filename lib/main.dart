import 'dart:async' as HydratedBlocOverrides;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/router/routes.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/cubit/theme_states.dart';
import 'features/splash/view_model/cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit()..loadSplash(),
        ),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: themeState.applightTheme,
          darkTheme: themeState.appdarkTheme,
          themeMode: themeState.themeMode,
          
        );
      },
    );
  }
}
