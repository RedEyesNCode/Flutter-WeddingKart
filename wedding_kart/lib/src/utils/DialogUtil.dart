import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/widgets/BaseDialog.dart';

class DialogUtil {
  static void showDialogWithOk({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onOk,
    bool barrierDismissible = true,
    Color backgroundColor = Colors.white,
    double elevation = 24.0,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return BaseDialog(
          title: title,
          message: message,
          onOk: onOk,
          backgroundColor: backgroundColor,
          elevation: elevation,
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
