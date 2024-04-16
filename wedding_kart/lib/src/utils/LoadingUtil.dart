import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/widgets/LoadingDialog.dart';

class LoadingUtil {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
