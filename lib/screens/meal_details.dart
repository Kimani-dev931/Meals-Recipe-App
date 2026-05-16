import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/meal.dart';
import '../Widgets/meal_details_item.dart';
import 'package:meals/providers/favourites_provider.dart';


class MealDetails extends ConsumerWidget{
  const MealDetails({required this.title,required this.meal,super.key});

  final String title;
  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: (){
                final wasAdded = ref.read(favoriteMealsProvider.notifier).toggleMealFavouriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(wasAdded ? 'Meal added as a favorite.' : 'Meal removed')));
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: MealDetailsItem(meal:meal),
    );
  }
}