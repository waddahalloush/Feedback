import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/translations/locale_keys.g.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onTap;
  const ConfirmButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 600.w,
        alignment: Alignment.center,
        height: 100.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 12.r,
              color: const Color.fromARGB(255, 180, 173, 251),
              offset: const Offset(0, 2))
        ], borderRadius: BorderRadius.circular(25.r), color: Colors.teal),
        child: Text(
          LocaleKeys.confirm.tr(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
