import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Models/meal.dart';

class MealItem extends StatelessWidget{
 const MealItem({required this.meal,required this.selectMeal,super.key});

 final Meal meal;
 final void Function() selectMeal;

 String get complexityText{
   return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
 }

 String get affordabilityText{
   return meal.affordability.name[0] + meal.affordability.name.substring(1);

 }

 @override
  Widget build(BuildContext context){
   return Card(
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.hardEdge,
    elevation: 2,
    child: InkWell(
     onTap: selectMeal,
     child:Stack(
      children: [
       FadeInImage(
           placeholder: MemoryImage(kTransparentImage),
           image:NetworkImage(meal.imageUrl),
           height: 200,
           width: double.infinity,
           fit: BoxFit.cover,
       ),
       Positioned(
           bottom: 0,
           left: 0,
           right: 0,
           child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
            color: Colors.black54,
            child: Column(
             children: [
              Text(
               meal.title,
               style: const TextStyle(color: Colors.white),
               textAlign: TextAlign.center,
               maxLines: 2,
               softWrap: true,
               overflow: TextOverflow.ellipsis,

              ),
              const SizedBox(height: 20,),
              Row(children: [
                 MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                 const SizedBox(width: 10,),
                MealItemTrait(icon: Icons.work, label: complexityText),
                const SizedBox(width: 10,),
                MealItemTrait(icon: Icons.attach_money, label: affordabilityText),
              ],)
             ],
            ),
           ),
       ),
      ],
     ),
    ),
   );
 }



}