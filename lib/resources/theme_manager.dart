import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/resources/color_manger.dart';
import 'package:gallery/resources/font_manager.dart';
import 'package:gallery/resources/style_manager.dart';
import 'package:gallery/resources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // Main Colors
      scaffoldBackgroundColor: ColorManager.general,
      primaryColor: ColorManager.primary,

      // CardView Theme
      cardTheme: CardTheme(
        color: ColorManager.neutral200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            side:
                BorderSide(color: ColorManager.neutral300, width: AppSize.s1)),
        // shadowColor: ColorManager.neutral900,
        // elevation: AppSize.s4,
      ),

      // App bar Theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.general,
          elevation: AppSize.s0,
          iconTheme: IconThemeData(color: ColorManager.textColor),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.general,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          titleTextStyle: getMediumStyle(
              color: ColorManager.textColor, fontSize: FontSize.s20)),

      // Elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              textStyle: getBoldStyle(
                  color: Colors.red, fontSize: FontSize.s18))),

      // Text Theme
      textTheme: TextTheme(
        // text theme
        displayLarge: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s32),
        displayMedium: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s16),
        displaySmall: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s14),

        // ---->  headline theme
        headlineLarge: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s28),
        headlineMedium: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s24),
        headlineSmall: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s20),
        // ---->  title theme
        titleLarge: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s18),
        titleMedium: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s16),
        titleSmall: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s14),

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.general,
          elevation: AppSize.s0,
          selectedItemColor: ColorManager.primary,
          unselectedIconTheme: IconThemeData(color: ColorManager.neutral400)),

      // TextFormField Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.fromLTRB(
            AppPadding.p0, AppPadding.p16, AppPadding.p0, AppPadding.p16),
        hintStyle: getRegularStyle(
            color: ColorManager.neutral400, fontSize: FontSize.s14),
        labelStyle: getMediumStyle(
            color: ColorManager.textColor, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.danger500),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.general,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s60))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.general,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s60))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.danger500,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s60))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.general,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s60))),
      ));
}
