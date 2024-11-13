import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {
 static void showError(String message,BuildContext context) {
    showTopSnackBar(
       reverseAnimationDuration: const Duration(seconds: 2),
       displayDuration:  const Duration(milliseconds: 100),
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showInfor(String message,BuildContext context) {
    showTopSnackBar(
      reverseAnimationDuration: const Duration(seconds: 1),
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  }

  static void showSucces(String message,BuildContext context) {
    showTopSnackBar(
       reverseAnimationDuration: const Duration(seconds: 1),
       displayDuration:  const Duration(seconds: 1),
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

}
