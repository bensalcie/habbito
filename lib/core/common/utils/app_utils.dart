import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_subtitle.dart';
import 'package:habbito/themes/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

//Show snackbar
void showSnackBar({
  required context,
  required message,
  required SnackBarType type,
}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: type == SnackBarType.success
          ? kPrimaryDark
          : type == SnackBarType.warning
              ? Colors.amber
              : Colors.red,
      content: AppTextViewSubtitle(text: message, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
    ));
  });
}

void showGeneralDialogFrom(
    {required BuildContext context, required Widget widget}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "SKy Garden",
    barrierDismissible: true,
    // Allow the sheet to take up the full height
    useRootNavigator:
        true, //uncomment this to showModalBottomSheet ahead bottomnavigationbar
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return SizedBox(height: 240, child: widget);
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

enum SnackBarType { success, warning, error }

//Show BoTTOM SHEET
void showBottomSheetForm(
    {required BuildContext context,
    required Widget view,
    Function()? onDialogDissmissed,
    bool isDismissible = true}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    showModalBottomSheet<void>(
      enableDrag: false,
      context: context,

      isDismissible: isDismissible,
      useSafeArea: true,
      isScrollControlled: true, // Allow the sheet to take up the full height
      useRootNavigator:
          true, //uncomment this to showModalBottomSheet ahead bottomnavigationbar
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      builder: (BuildContext context) {
        return view;
      },
    ).whenComplete(() {
      onDialogDissmissed != null ? onDialogDissmissed() : null;
    });
  });
}

Future<String?> pickDateOfBirth({
  required BuildContext context,
}) async {
  final DateTime currentDate = DateTime.now();
  final int currentYear = currentDate.year;

  DateTime firstDate = DateTime(currentYear - 18, currentDate.month,
      currentDate.day); // 18 years ago from today
  DateTime lastDate =
      DateTime(1900, 1, 1); // A reasonable lower bound, e.g., 1900

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: firstDate,
    firstDate: lastDate,
    lastDate: firstDate,
  );

  if (selectedDate != null && context.mounted) {
    DateTime selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(selectedDateTime);

    return formattedDate;
  }

  return null;
}

//Pick Normal date.
Future<String?> pickDate({
  required BuildContext context,
}) async {
  final DateTime currentDate = DateTime.now();
  final int currentYear = currentDate.year;

  DateTime firstDate = DateTime(currentYear, currentDate.month,
      currentDate.day); // 18 years ago from today
  DateTime lastDate =
      DateTime(1900, 1, 1); // A reasonable lower bound, e.g., 1900

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: firstDate,
    firstDate: lastDate,
    lastDate: firstDate,
  );

  if (selectedDate != null && context.mounted) {
    DateTime selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(selectedDateTime);

    return formattedDate;
  }

  return null;
}

//Pick Normal date time.
Future<String?> pickDateTime({
  required BuildContext context,
}) async {
  final DateTime currentDate = DateTime.now();
  final int currentYear = currentDate.year;

  DateTime firstDate = DateTime(currentYear, currentDate.month,
      currentDate.day); // Set a date in the past
  DateTime lastDate =
      DateTime(1900, 1, 1); // A reasonable lower bound, e.g., 1900

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: firstDate,
    firstDate: lastDate,
    lastDate: firstDate,
  );

  if (selectedDate != null && context.mounted) {
    final TimeOfDay? selectedTime = await getTimeOfDay(context: context);

    if (selectedTime != null && context.mounted) {
      DateTime selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final String formattedDateTime = formatter.format(selectedDateTime);

      return formattedDateTime;
    }
  }

  return null;
}

//Get N last characters of a string
extension E on String {
  String lastChars(int n) => substring(length - n);
}

//Get file size.

extension FileUtils on File {
  get size {
    int sizeInBytes = lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb.ceil();
  }
}

//Get type.
String? getFileExtension(String? fileName) {
  try {
    return "${fileName?.split('.').last}";
  } catch (e) {
    return null;
  }
}

//Get file name
extension FileExtention on FileSystemEntity {
  String? get name {
    return path.split(Platform.pathSeparator).last;
  }
}

//  Convert URL Launcher Map  to valid path.
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

//Function to help Generate random number of empty strings.
//(Helps in handling graphql repeated requests)
String generateRandomEmptyString() {
  Random random = Random();
  int length = random.nextInt(11); // Generates a random length between 0 and 10
  return ''.padLeft(length);
}

//Get Date time from int datetime.
String getDateTimeFromMillis(int millis) {
  // Convert timestamp to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millis);

  // Format the DateTime
  String formattedDateTime = DateFormat('h:mma - MMM d, y').format(dateTime);

  return formattedDateTime; // Output: 12:49am - May 12, 2023
}

Future<TimeOfDay?> getTimeOfDay({
  required BuildContext context,
  String? title,
  TimeOfDay? initialTime,
  String? cancelText,
  String? confirmText,
}) async {
  TimeOfDay? time = await showTimePicker(
    initialEntryMode: TimePickerEntryMode.dial,
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    cancelText: cancelText ?? cancel,
    confirmText: confirmText ?? "Select",
    helpText: title ?? "Select time",
    builder: (context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );

  return time;
}

// Open Url in Browser.
// Future<void> openInBrowser({required String urltoOpen}) async {
//   if (!await launchUrl(Uri.parse(urltoOpen))) {
//     throw Exception('Could not launch $urltoOpen');
//   }
// }

//Check if String contains numbers only
bool isNumeric(String str) {
  try {
    int.parse(str);
    return true;
  } catch (e) {
    // The string is not a valid integer
    return false;
  }
}

/// [isValidPhoneNumber]Check if Phone number is valid.
bool isValidPhoneNumber(String phonenumber) {
  String mobileNumber = phonenumber.toString().trim();
  if (mobileNumber.isEmpty) {
    return false;
  } else if (mobileNumber.length < 10) {
    return false;
  } else if (mobileNumber.length > 10) {
    return false;
  } else {
    return true;
  }
}

//Get N last Days.

String get60DaysFilter(int daysbefore) {
  DateTime now = DateTime.now().subtract(Duration(days: daysbefore));
  String formattedDate =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(now.toUtc());
  return formattedDate;
}

String getCurrentDateTime() {
  DateTime now = DateTime.now();
  String formattedDate =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(now.toUtc());
  return formattedDate;
}

// Allow formating a number given string to fo commas
extension FormatNumberExtension on String {
  String formatWithCommas() {
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return replaceAllMapped(regex, (Match match) => '${match[1]},');
  }
}

//Split Name, Key Values from Product Features.
String getProductFeatures(String input) {
  final parts = input.split(RegExp(r",\s*"));
  final formattedOutput = StringBuffer();

  for (final part in parts) {
    final keyValue = part.split(RegExp(r"\s*:\s*"));
    final name = keyValue[1].trim();
    final value = keyValue[3].trim().toUpperCase();
    formattedOutput.write('$name: $value\n');
  }

  return formattedOutput.toString();
}

//Format OTP into corresponding separation.
String formatOTP(String otpValue) {
  return '${otpValue.substring(0, 3)} ${otpValue.substring(3)}';
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

String convertDateTime(String inputDateTime) {
  // Parse the input date string to a DateTime object
  DateTime dateTime = DateTime.parse(inputDateTime).toLocal();

  // Define the desired output format
  DateFormat outputFormat = DateFormat('MMM dd, hh:mm a');

  // Format the DateTime object to the desired format
  return outputFormat.format(dateTime);
}

int extractYear(String dateString) {
  try {
    if (dateString.isNotEmpty) {
      DateTime dateTime = DateTime.parse(dateString);
      return dateTime.year;
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error parsing date: $e");
    }
  }

  // If date parsing fails or dateString is empty, return the current year
  return DateTime.now().year;
}

// Extract Brand Shop names.
String extractShopName(String url) {
  // Parse the URL
  var uri = Uri.parse(url);

  // Get the path and split by slashes
  List<String> segments = uri.path.split('/');

  // Get the last segment which should be the shop name
  String shopName = segments.lastWhere((segment) => segment.isNotEmpty);

  return shopName;
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
// Open Url in Browser.
Future<void> openInBrowser({required String urltoOpen}) async {
  if (!await launchUrl(Uri.parse(urltoOpen))) {
    throw Exception('Could not launch $urltoOpen');
  }
}