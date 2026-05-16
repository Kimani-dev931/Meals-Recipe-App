import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

import '../Models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{

  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final mealsIsFavourite = state.contains(meal);
    if(mealsIsFavourite){
      state = state.where((m) => meal.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }

  }

}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});