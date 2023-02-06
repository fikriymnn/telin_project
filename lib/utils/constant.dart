import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

ProgressDialog? pr;

class UtilsApps {
  static void showDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.show();
  }

  static void hideDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.hide();
  }
}
