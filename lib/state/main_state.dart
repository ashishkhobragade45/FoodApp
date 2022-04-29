
import 'package:foodapp/model/RestaurantModel.dart';
import 'package:get/get.dart';

class MainStateController extends GetxController{

  var selectedRestaurant = RestaurantModel(
      address: 'address',
      name: 'name',
      imageUrl: 'imageUrl',
      paymentUrl: 'paymentUrl',
      phone: 'phone').obs;

}