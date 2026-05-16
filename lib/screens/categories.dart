import 'package:flutter/material.dart';

import '../Data/dummy_data.dart';
import '../Models/category.dart';
import '../Models/meal.dart';
import '../Widgets/category_grid_item.dart';
import 'filters.dart';
import 'meals.dart';


class Categories extends StatelessWidget{
  const Categories({super.key,required this.availableMeals});



  final List<Meal> availableMeals;




  void _selectedCategory(BuildContext context,Category category){
    final filteredMeals = availableMeals.where((meal){
      return meal.categories.contains(category.id);
    }).toList();
    
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return Meals(title: category.title,meals: filteredMeals);
    }));
  }

  @override
  Widget build(BuildContext context){
    return GridView(
        padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
          ),
        children: [
          ...availableCategories.map((category){
            return CategoryGridItem(category:category,onSelectedCategory:(){
              _selectedCategory(context,category);
            },);
          })
          // for(final category in availableCategories)
          //   CategoryGridItem(category:category),


        ],
      );
  }
}