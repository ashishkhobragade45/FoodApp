import 'package:foodapp/model/RestaurantModel.dart';

abstract class MainViewModel{
  Future<List<RestaurantModel>> displayRestaurantList();
}