import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';

Color kPrimaryColor = HexColor("#F4F5F7");
Color kDescriptionDetailsColor = HexColor("#fff8f6");

Color kPrimaryDark = HexColor('#BF3A8C');
Color kBodyBackground = Colors.grey;
Color kButtonDark = HexColor("#0B1327");
Color kDarkBannerColor = HexColor('#333333');
Color kLightCardBackgroundColor = HexColor('#F4F5F7');
Color kCategorySmallCardColor = HexColor('#C9DCED');
Color kTimerTextColor = HexColor('#F97066');
Color kTimerTitleDescColor = HexColor('#646464');
Color kCategoryMenuOtionCardColor = HexColor('#F4F5F7');
Color kCardBorderColor = const Color.fromRGBO(0, 0, 0, 0.04);
Color kWishDiscountBannerBac = HexColor('#FCE4D9');
Color kStartApplicationDarkBtnColor = HexColor('#4C4C4C');
Color kTextColorFaintGrey = HexColor('#9D9D9D');
Color kGreenTextColor = HexColor('#4D6F16');
Color kInfoIconBacColor = HexColor('#B68D24');
Color kSuccessIconBacColor = HexColor('#76A12C');
Color kTrackOrderInactive = const Color(0xFF9D9D9D);

Color kNoAvailableLimitCardBac = const Color(0xFFFFD8D8);

Color kDividerBelowCardBacColor = const Color(0xFFF4F5F7);

Color deliverystatusChipBacColor = const Color(0xFFFCE4D9);
Color kFacebookBlue = const Color(0xFF1877F2);

Color kAddressCardBacGrey = const Color(0xFFF4F5F7);
Color kColorPickerCardBackground = const Color.fromRGBO(217, 217, 217, 0.50);
Color kTextInputTextColor = HexColor("#F4F5F7");
Color kGreyColor = HexColor('#4D3D3D');
Color kCardGreyColor = HexColor('#F7FDF9');
Color kProductDetailsSellerCardBac = HexColor('#F9E6EC');
Color kProductDetailsRateStarColor = HexColor('#FDCC0D');
Color kFAQBackground = HexColor('#F4F5F7');
Color kColorSelectionBorderColor = HexColor('#C4C4C4');

Color kCardTrackingHistoryBaColor = HexColor('#F4F5F7');
Color kIconDarkColor = HexColor('#4D4D4D');

Color kTrackingCardOrderShippingMethodBac = HexColor('#FCE4D9');

Color kOrderNumberBackgroundColor = HexColor('#FCE4D9');

Color kPaymentOptionBackground = HexColor('#F4F5F7');
Color kActivePaymentOptionBackground = HexColor('#FCE4D9');

Color kDiscountBackgroundColor = HexColor('#82C492');
Color kDiscountedAmountColor = HexColor('#DADADA');
Color kDefaultProgressColor = HexColor('#E84F1F');
Color kRatingCountTextColor = HexColor('#4C4C4C');
Color kLowStockWarningColor = HexColor('#F97066');
Color kCategorytitleColor = HexColor('#4D4D4D');
Color kLargeTitleColor = HexColor('#808080');
Color kAccountCardOptionColor = HexColor('#4D4D4D');
Color kTextInputBackgroundColor = HexColor("#F4F5F7");
Color kOTPInputViewBacColor = HexColor('#E8F1D9');
Color kTotalInCartBac = HexColor('#FCE4D9');

//Gradient Button.
Color kBlueColorForGradient = HexColor("#26388D");
Color kRedColorForGradient = HexColor("#E85020");

Color kLightColor = HexColor("#FFFFFF");
Color kTextDarkColor = HexColor("#0E1206");
Color kDotSelected = HexColor("#153CA899");
Color kTextActionBar = HexColor("#6E9232");
Color kIconThemeColor = HexColor("#1A2139");
Color kInputTitleColor = HexColor("#515151");
Color kPageBackgroudColor = const Color.fromRGBO(244, 245, 247, 1);
Color kColorAccent = HexColor('#BF3A8C');
Color kCardBackground = HexColor('#B9D48C');
Color kTransferMoneyInfoCard = HexColor('#F1EBD9');
Color kTransferMoneyInfoCardTextColor = HexColor('#374919');
Color kTextDarkUtilityRecord = HexColor('#0E1206');
Color kSuccessStatusColor = HexColor('#0FA64E');
Color kUtilityDetailsDividerColor = HexColor('#DCE9C5');
Color kWarningColor = HexColor('#DB4343');
Color kPayeeEditBtnColorDark = HexColor('#293713');
Color kDividerColor = HexColor('#DBD8D8');
Color kSubtitlePrimaryColor = HexColor('#536E26');
Color kBtnDarkColor = HexColor('#0B1327');
Color kBtnDanger = HexColor('#C59506');

Color kIconColor = HexColor('#374919');
Color kUtilitiesIconColor = HexColor('#F3F8EC');

Color kDividerHeaderSubtitleColor = HexColor('#374919');

Color kPasswordCheckDarkColor = HexColor("#293713");
Color kPasswordCheckerTileColor = HexColor('#7575751A');
Color kFilePickerBackgroundDark = HexColor('#374919');
Color kFileDiscardColor = const Color.fromRGBO(219, 67, 67, 1);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppTheme {
  static ThemeData main() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 123, 60, 231)),
        useMaterial3: true,
        fontFamily: app_font,
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kPageBackgroudColor,
          toolbarTextStyle: TextStyle(
              color: kTextActionBar,
              fontFamily: app_font,
              fontSize: 15,
              fontWeight: FontWeight.w600),
          elevation: 0,
          iconTheme: IconThemeData(color: kIconThemeColor, size: 20),
          actionsIconTheme: IconThemeData(
            color: kTextDarkColor,
          ),
          centerTitle: false,
        ),
        // colorScheme: ColorScheme.light(primary: kPrimaryColor),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: kPrimaryDark),
        // datePickerTheme: DatePickerThemeData(
        //     headerBackgroundColor: kPrimaryColor,
        //     rangeSelectionBackgroundColor: kPrimaryColor,
        //     todayBackgroundColor: MaterialStateProperty.all(kPrimaryColor),
        //     surfaceTintColor: kPrimaryColor),
        textTheme: const TextTheme().copyWith(

            // bodyMedium: const TextStyle(
            //   color: kTextOnLight,
            //   height: 1.25,
            // ),
            //   headlineSmall: const TextStyle(color: kTextOnLight),
            //   titleMedium: const TextStyle(
            //     color: kTextOnLight,
            //     fontWeight: FontWeight.w700,
            //   ),
            //   titleSmall: const TextStyle(color: kGrayDark),
            // ),
            // iconTheme: const IconThemeData(color: kTextOnLight),
            // textSelectionTheme: const TextSelectionThemeData(
            //   cursorColor: Palette.kPrimaryColor,
            // ),
            // visualDensity: VisualDensity.adaptivePlatformDensity,
            // colorScheme: ColorScheme.fromSwatch(
            //   primarySwatch: Palette.kToLight,
            // ).copyWith(
            //   secondary: Palette.kAccentColor,
            //   tertiary: Palette.kTertiaryColor,
            //   primary: Palette.kToDark,
            // ),
            // appBarTheme: AppBarTheme(
            //   backgroundColor: kBackground.withOpacity(0.5),
            //   titleTextStyle: const TextStyle(
            //     color: kTextOnLight,
            //   ),
            //   elevation: 0,
            //   iconTheme: const IconThemeData(
            //     color: kBackgroundDark,
            //   ),
            //   actionsIconTheme: const IconThemeData(
            //     color: kBackgroundDark,
            //   ),
            //   centerTitle: true,
            // ),
            // inputDecorationTheme: const InputDecorationTheme(
            //   fillColor: Palette.kTertiaryColor,
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     borderSide: BorderSide(
            //       color: Palette.kTertiaryColor,
            //     ),
            //   ),
            //   prefixIconColor: Color.fromARGB(255, 125, 130, 130),
            //   hintStyle: TextStyle(fontSize: 16.0),
            // ),
            // textButtonTheme: TextButtonThemeData(
            //   style: TextButton.styleFrom(
            //     foregroundColor: kTextOnDark,
            //     textStyle: const TextStyle(
            //       fontWeight: FontWeight.w700,
            //     ),
            //     shape: const StadiumBorder(),
            //     backgroundColor: Palette.kPrimaryColor,
            //   ),
            ),
        // fontFamily: 'Apfel Grotezk',
        // scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kBodyBackground,
          selectedItemColor: kPrimaryDark,
          elevation: 2,
        ),
        dividerColor: kPrimaryColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: kLightColor,
        ),
        // bottomAppBarTheme: BottomAppBarTheme(
        //   color: kPrimaryColor,
        //   elevation: 0,
        // ),
        scaffoldBackgroundColor: kLightColor);
  }
}
