import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/core/theme/app_theme.dart';
import 'package:pulseboard/core/theme/provider/theme_provider.dart';
import 'package:pulseboard/routes/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Use URL path strategy for web (removes # from URLs)
  setPathUrlStrategy();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final _appRouter = AppRouter();

    return MaterialApp.router(
      title: 'PulseBoard',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeState.themeMode == ThemeModeType.system
          ? ThemeMode.system
          : themeState.themeMode == ThemeModeType.light
              ? ThemeMode.light
              : ThemeMode.dark,
      routerConfig: _appRouter.config(),
    );
  }
}
