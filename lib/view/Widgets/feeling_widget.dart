import 'package:medical/Core/constants/asset_manager.dart';

String feelImage(String feel) {
  switch (feel) {
    case "سيء":
      return AssetManager.worst;
    case "مقبول":
      return AssetManager.poor;
    case "جيد":
      return AssetManager.average;
    case "جيد جداً":
      return AssetManager.good;
    case "ممتاز":
      return AssetManager.excellent;
    case "Worst":
      return AssetManager.worst;
    case "Poor":
      return AssetManager.poor;
    case "Good":
      return AssetManager.average;
    case "Very Good":
      return AssetManager.good;
    case "Excellent":
      return AssetManager.excellent;
    default:
      return AssetManager.note;
  }
}
