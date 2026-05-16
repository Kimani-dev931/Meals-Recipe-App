import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favourites_provider.dart';

import '../Models/meal.dart';
import 'categories.dart';
import 'filters.dart';
import 'main_drawer.dart';

final kInitialFilters ={
  Filter.glutenFree :false,
  Filter.lactoseFree : false,
  Filter.vegan : false,
  Filter.vegetarian : false,
};

class Tabs extends ConsumerStatefulWidget{


  @override
  ConsumerState<Tabs> createState(){
    return _TabsState();
  }
}

class _TabsState extends  ConsumerState<Tabs>{
  int _selectedIndex = 0;
  Map<Filter,bool> _selectedFilters =kInitialFilters;


  void _selectScreen(String identifier)async{
    Navigator.of(context).pop();
    if(identifier == 'filters'){
      //pushReplacement -can also be used but it does not contain the back arrow
      final result = await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx) => Filters(currentFilters: _selectedFilters,)));
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }

  }




  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    final meals = ref.watch(mealsProvider);
    final _availableMeals = meals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
    Widget activePage = Categories(availableMeals:_availableMeals,);

    if(_selectedIndex == 1){
      final favouriteMeals = ref.watch(favoriteMealsProvider);
      activePage = Meals(meals: favouriteMeals,);
    }
    return Scaffold(
      drawer: MainDrawer(selectScreen: _selectScreen,),
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites'),
        ],
      ),
    );
  }
}