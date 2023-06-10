import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/widgets/dialogs/error_dialog.dart';

class HandleException {
  HandleException._();

  static handle({
    required BuildContext context,
  }) {
    showErrorDialog(
      context: context,
      message: LocaleKeys.errorTitle.tr(),
      content: LocaleKeys.errorContent.tr(),
    );
  }

  static showErrorDialog({
    required BuildContext context,
    required String message,
    required String content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ErrorDialog(
          message: message,
          content: content,
        );
      },
    );
  }
}
