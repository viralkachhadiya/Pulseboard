import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/core/theme/app_theme.dart';

enum ThemeModeType { system, light, dark }

class ThemeState {
  final ThemeModeType themeMode;
  final ThemeData theme;

  ThemeState({
    required this.themeMode,
    required this.theme,
  });

  ThemeState copyWith({
    ThemeModeType? themeMode,
    ThemeData? theme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      theme: theme ?? this.theme,
    );
  }
}

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier()
      : super(ThemeState(
          themeMode: ThemeModeType.system,
          theme: AppTheme.lightTheme,
        ));

  void setThemeMode(ThemeModeType mode) {
    switch (mode) {
      case ThemeModeType.system:
        state = state.copyWith(
          themeMode: mode,
          theme: AppTheme.lightTheme,
        );
        break;
      case ThemeModeType.light:
        state = state.copyWith(
          themeMode: mode,
          theme: AppTheme.lightTheme,
        );
        break;
      case ThemeModeType.dark:
        state = state.copyWith(
          themeMode: mode,
          theme: AppTheme.darkTheme,
        );
        break;
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});
