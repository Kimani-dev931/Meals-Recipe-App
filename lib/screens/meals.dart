import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item.dart';
import 'package:meals/screens/meal_details.dart';

import '../Models/meal.dart';


class Meals extends StatelessWidget{
  const Meals({this.title,required this.meals,super.key});

  final String? title;
  final List<Meal> meals;



  void _selectMeals(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return MealDetails(title:meal.title, meal: meal,);
    }));
  }

  @override
 Widget build(BuildContext context){
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Ooh...No.. nothing here.....',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(height: 10,),
          Text('Please try another category..',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),)
        ],),
    );

    if(meals.isNotEmpty){
      content =ListView.builder(itemCount:meals.length,itemBuilder: (ctx, index){
        return MealItem(meal: meals[index],selectMeal: (){
          _selectMeals(context,meals[index]);
        },);
      });

    }
    if(title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content ,
    );
  }
}
