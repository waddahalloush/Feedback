import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/utils/media_query_ex.dart';

Future<void> addSucessDialog(BuildContext context, String title, String desc,
        {bool isFeedBack = false}) =>
    AwesomeDialog(
            autoHide: const Duration(milliseconds: 3000),
            context: context,
            width: context.width / 2,
            dialogType: DialogType.success,
            title: title,
            desc: desc)
        .show();
