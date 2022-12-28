import 'package:medical/Core/constants/asset_manager.dart';

String feelImage(String feel) {
  switch (feel) {
    case "سيء":
      return AssetManager.worst;
    case "فقير":
      return AssetManager.poor;
    case "متوسط":
      return AssetManager.average;
    case "جيد":
      return AssetManager.good;
    case "ممتاز":
      return AssetManager.excellent;
    case "Worst":
      return AssetManager.worst;
    case "Poor":
      return AssetManager.poor;
    case "Average":
      return AssetManager.average;
    case "Good":
      return AssetManager.good;
    case "Excellent":
      return AssetManager.excellent;
    default:
      return AssetManager.note;
  }
}
