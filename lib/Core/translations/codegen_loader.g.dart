// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "adminPanel": "لوحة التحكم",
  "addDepartment": "إضافة قسم جديد",
  "emptyDep": "الحقل الخاص باسم القسم لايمكن أن يكون فارغ",
  "depName": "اسم القسم",
  "addDoctor": "إضافة أطباء",
  "emptyDoctor": "اسم الطبيب لايمكن أن يكون فارغ",
  "doctorName": "اسم الطبيب",
  "addSuccess": "نجاح",
  "successAddDep": "تمت العملية بنجاح",
  "adminInfo": "تغيير معلومات المسؤول",
  "average": "جيد",
  "canAccess": "مرحبا بك الآن يمكنك الدخول الى واجهة المسؤول",
  "cantAccess": "ليس لديك صلاحية الدخول الى واجهة المسؤول",
  "departments": "الأقسام",
  "doctors": "الأطباء",
  "excellent": "ممتاز",
  "good": "جيد جداً",
  "poor": "مقبول",
  "reviewFeedBack": "مشاهدة المراجعات",
  "welcome": "صحتك هي أهم أولوياتنا",
  "welcomeSub": "الرجاء امنحنا تقييمك على خدمات المركز",
  "worst": "سيء",
  "confirmAccess": "تأكيد المرور",
  "accessInfo": "أدخل اسم و كلمة مرور المسؤول للدخول",
  "adminName": "اسم المسؤول",
  "adminPassword": "كلمة سر المسؤول",
  "centerDepartment": "أقسام المركز",
  "centerDoctors": "أطباء المركز",
  "reviewFbScr": "مراجعة التقييمات",
  "chgAdminInfo": "تغيير معلومات المسؤول",
  "chgAdminNmPass": "تغيير اسم و كلمة مرور المسؤول",
  "feedBack": "اكتب رأيك بما يخص الأطباء و خدمات المركز",
  "emptyDesc": "حقل الوصف لا يمكن أن يكون فارغ",
  "desc": "الوصف",
  "confirm": "تأكيد",
  "updateDocNm": "تغيير اسم الدكتور",
  "updateDepNm": "تغيير اسم القسم",
  "thanks": "شكرا على رأيك",
  "thanksDesc": "نحن مسرورين بتقبل تقييمك",
  "chgLang": "تغيير لغة التطبيق",
  "chooseDep": "اختر قسم ",
  "chooseDoc": "اختر طبيب"
};
static const Map<String,dynamic> en = {
  "adminPanel": "Admin Panel",
  "addDepartment": "Add New Department",
  "emptyDep": "The Department Name Can't Be Empty",
  "depName": "Department Name",
  "addDoctor": "Add Doctors",
  "emptyDoctor": "The Doctor Name Can't Be Empty",
  "doctorName": "Doctor Name",
  "addSuccess": "Success",
  "successAddDep": "The Operation Was Completed Successfully",
  "adminInfo": "Change Admin Info",
  "average": "Good",
  "canAccess": "Welcome You Can Access Admin Panel",
  "cantAccess": "You Don't Have Access To Admin Panel",
  "departments": "Departments",
  "doctors": "Doctors",
  "excellent": "Excellent",
  "good": "Very Good",
  "poor": "Poor",
  "reviewFeedBack": "Review FeedBack",
  "welcome": "Your Health Is Our Priority",
  "welcomeSub": "Please give us your evaluation of the center's services",
  "worst": "Worst",
  "confirmAccess": "Confirm Access",
  "accessInfo": "Enter Admin Name With Admin Password To Access",
  "adminName": "Admin Name",
  "adminPassword": "Admin Password",
  "centerDepartment": "Center Department",
  "centerDoctors": "Center Doctors",
  "reviewFbScr": "Review Feedback ",
  "chgAdminInfo": "Change Admin Info",
  "chgAdminNmPass": "Change Admin Name And Admin Password",
  "feedBack": "Write Your Opinion About Our Services & Doctors",
  "emptyDesc": "The Description field can't be empty",
  "desc": "Description",
  "confirm": "Confirm",
  "updateDocNm": "Update Doctor Name",
  "updateDepNm": "Update Department Name",
  "thanks": "Thanks for your opinion",
  "thanksDesc": "We are glad to receive your evaluation",
  "chgLang": "Change App Language",
  "chooseDep": "Choose a department",
  "chooseDoc": "Choose a Doctor"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
