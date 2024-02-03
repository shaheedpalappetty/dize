import 'package:dize/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildCustomSnackBar(message),
    );
  }

  static SnackBar _buildCustomSnackBar(String message) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(bottom: 5),
      backgroundColor: Colors.red,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(message, style: DizeTextStyle.alertText),
          ),
        ),
      ),
    );
  }
}
