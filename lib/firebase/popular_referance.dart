

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp/model/popular_item_model.dart';

import '../strings/main_strings.dart';



Future<List<PopularItemModel>> getMostPopularByRestaurantId(String restaurantId)  async {
  var list = List<PopularItemModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference()
      .child(RESTAURANT_REF)
      .child(restaurantId)
      .child(MOST_POPULAR_REF)
      .once();
  Map<dynamic,dynamic>.from(source.snapshot.value as dynamic).forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });


  return list;

}