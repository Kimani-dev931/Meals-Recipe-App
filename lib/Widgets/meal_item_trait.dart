import 'package:flutter/material.dart';


class MealItemTrait extends StatelessWidget{
  const MealItemTrait({required this.icon,required this.label,super.key});

  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(icon,color: Colors.white,size: 15,),
      const SizedBox(width: 5,),
      Text(label,style: const TextStyle(color: Colors.white,fontSize: 15),),
    ],);
  }
}