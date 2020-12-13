import 'package:flutter/material.dart';
import 'package:food_market_client/models/models.dart';
import 'package:food_market_client/ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetailPage(
        transaction: mockTransactions[0],
      ),
    );
  }
}
