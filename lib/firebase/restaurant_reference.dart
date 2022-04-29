
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../const/const.dart';
import '../model/RestaurantModel.dart';

Future<List<RestaurantModel>> getRestaurantList()  async {
  var list = List<RestaurantModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();

  RestaurantModel? restaurantModel;

  Map<dynamic,dynamic>.from(source.snapshot.value as dynamic).forEach((key, value) {
    restaurantModel = RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
    restaurantModel!.restautrantId = key;
    list.add(restaurantModel!);
  });


  return list;

}