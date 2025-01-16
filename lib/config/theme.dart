// Open Flutter E-commerce Light Theme
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}

class AppConsts {
  static const page_size = 20;
}

// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      hintColor: AppColors.red,
      dialogBackgroundColor: AppColors.backgroundLight,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          toolbarTextStyle: theme.textTheme
              .copyWith(
                  bodySmall: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400,
              ))
              .bodyMedium,
          titleTextStyle: theme.textTheme
              .copyWith(
                  bodySmall: TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w400,
              ))
              .titleLarge),
      textTheme: theme.textTheme
          .copyWith(
            //over image white text
            headlineSmall: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 48,
              color: AppColors.white,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w900,
            ),
            titleLarge: theme.textTheme.titleLarge?.copyWith(
              fontSize: 24,
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontFamily: 'Metropolis',
            ), //

            //product title
            headlineMedium: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Metropolis',
            ),

            displaySmall: theme.textTheme.displaySmall?.copyWith(
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),
            //product price
            displayMedium: theme.textTheme.displayMedium?.copyWith(
              color: AppColors.lightGray,
              fontSize: 14,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),
            displayLarge: theme.textTheme.displayLarge?.copyWith(
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w500,
            ),

            titleSmall: theme.textTheme.titleSmall?.copyWith(
              fontSize: 18,
              color: AppColors.black,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),

            titleMedium: theme.textTheme.titleMedium?.copyWith(
              fontSize: 24,
              color: AppColors.darkGray,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w500,
            ),
            //red button with white text
            labelLarge: theme.textTheme.labelLarge?.copyWith(
              fontSize: 14,
              color: AppColors.white,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w500,
            ),
            //black caption title
            bodySmall: theme.textTheme.bodySmall?.copyWith(
              fontSize: 34,
              color: AppColors.black,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w700,
            ),
            //light gray small text
            bodyLarge: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.lightGray,
              fontSize: 11,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),
            //view all link
            bodyMedium: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 11,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),
          )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
      colorScheme: ColorScheme(
              surface: AppColors.background,
              brightness: Brightness.light,
              primary: AppColors.black,
              onPrimary: AppColors.white,
              secondary: AppColors.red,
              onSecondary: AppColors.white,
              error: AppColors.red,
              onError: AppColors.white,
              onSurface: AppColors.black)
          .copyWith(error: AppColors.red),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.lightGray),
    );
  }
}
