import 'package:flutter/material.dart';

import '../Core/utils/sql_db.dart';

class ReviewFeedBackProvider extends ChangeNotifier{
   List<Map> reviewList = [];
  bool isLoading = true;
  SqlDB sqlDB = SqlDB();
  void fitchReviews() {
    reviewList = [];
    sqlDB.readData("FeedBack").then((value) {
      reviewList.addAll(value);
      isLoading = false;
      notifyListeners();
    });
  }
   void deleteFeedback(int sqlid , int id) {
    sqlDB.deleteData('FeedBack', 'f_id = $sqlid').then((value) {
  
      reviewList.removeAt(id);
      notifyListeners();
    });
  }
}