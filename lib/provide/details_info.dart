import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;
  bool isLeft = true;
  bool isRight = false;

  // tabbar 切换
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  // 从后台获取商品数据
  getGoodsInfo(String id) async {
    var formData = {
      'goodId': id,
    };
    await request('getGoodDetailById', formData: formData).then((data) {
      var responseData = json.decode(data.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
