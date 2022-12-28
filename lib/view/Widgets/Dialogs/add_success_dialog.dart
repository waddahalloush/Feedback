import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medical/Core/utils/media_query_ex.dart';

addSucessDialog(BuildContext context, String title, String desc) =>
    AwesomeDialog(
            context: context,
            width: context.width / 2,
            dialogType: DialogType.success,
            title: title,
            desc: desc)
        .show();
