
import 'package:foodapp/firebase/best_deals_referance.dart';
import 'package:foodapp/firebase/popular_referance.dart';
import 'package:foodapp/model/popular_item_model.dart';
import 'package:foodapp/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';


class RestaurantHomeDetailViewModelImp extends RestaurantHomeDetailViewModel
{
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId) {
  return getBestDealByRestaurantId(restaurantId);
  }

}