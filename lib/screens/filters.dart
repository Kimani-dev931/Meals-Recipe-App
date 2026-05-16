import 'package:flutter/material.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/tabs.dart';



enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class Filters extends StatefulWidget{
  const Filters({super.key,required this.currentFilters});

  final Map<Filter,bool> currentFilters;
  @override
  State<Filters> createState(){
   return  FiltersState();
  }
}

class FiltersState extends State<Filters>{

  var _glutenFreeFilterCheck = false;
  var _isLactoseFreeFilterCheck = false;
  var _isVeganFilterCheck = false;
  var _isVegetarianFilterCheck = false;

  @override
  void initState(){
    super.initState();
    _glutenFreeFilterCheck = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFreeFilterCheck = widget.currentFilters[Filter.lactoseFree]!;
    _isVeganFilterCheck = widget.currentFilters[Filter.vegan]!;
    _isVegetarianFilterCheck = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // drawer: MainDrawer(selectScreen: (identifier){
      //   if(identifier == 'meals'){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Tabs()));
      //   }
      // },),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if(didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree : _glutenFreeFilterCheck,
              Filter.lactoseFree : _isLactoseFreeFilterCheck,
              Filter.vegan : _isVeganFilterCheck,
              Filter.vegetarian : _isVegetarianFilterCheck,
            });
        },
        child:Column(children: [
        SwitchListTile(
          value: _glutenFreeFilterCheck,
          onChanged: (isChecked){
            setState(() {
              _glutenFreeFilterCheck = isChecked;
            });
          },
          title: Text('Gluten Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
          subtitle:Text('Only Gluten free meals are allowed',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),) ,
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.symmetric(vertical: 22,horizontal: 34),
        ),
        SwitchListTile(
          value: _isLactoseFreeFilterCheck,
          onChanged: (isChecked){
            setState(() {
              _isLactoseFreeFilterCheck = isChecked;
            });
          },
          title: Text('Lactose Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
          subtitle:Text('Only Lactose free meals are allowed',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),) ,
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.symmetric(vertical: 22,horizontal: 34),
        ),
        SwitchListTile(
          value: _isVeganFilterCheck,
          onChanged: (isChecked){
            setState(() {
              _isVeganFilterCheck = isChecked;
            });
          },
          title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
          subtitle:Text('Only Vegan meals are allowed',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),) ,
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.symmetric(vertical: 22,horizontal: 34),
        ),
        SwitchListTile(
          value: _isVegetarianFilterCheck,
          onChanged: (isChecked){
            setState(() {
              _isVegetarianFilterCheck = isChecked;
            });
          },
          title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
          subtitle:Text('Only Vegetarian meals are allowed',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),) ,
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.symmetric(vertical: 22,horizontal: 34),
        )
      ],),),
    );


  }

}