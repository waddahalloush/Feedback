import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/Core/utils/media_query_ex.dart';

import '../../../Core/translations/locale_keys.g.dart';

showUpdateDoctorDialog(
        BuildContext context,TextEditingController doctorController, VoidCallback onOkPress) =>
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
     
      width: context.width / 2,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      dialogType: DialogType.infoReverse,
      showCloseIcon: true,
      body: Column(
        children: [
          Text(
            LocaleKeys.updateDocNm.tr(),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
        
          TextFormField(
            
            controller: doctorController,
            decoration: InputDecoration(
                label: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(LocaleKeys.doctorName.tr()),
            )),
          ),
          SizedBox(
            height: 30.h,
          ),
         
        ],
      ),
      btnOkOnPress: onOkPress,
    )..show();