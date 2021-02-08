import 'package:flutter/material.dart';
import 'package:hasmealapp/dummy_data.dart';
import 'package:hasmealapp/view/meal_details_view.dart';
import 'package:hasmealapp/view/meal_view.dart';
import 'package:hasmealapp/view/screens/filter_view.dart';
import 'package:hasmealapp/view/screens/tab_view.dart';

import 'model/meal_model.dart';
import 'view/screens/category_vew.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  Map<String, dynamic> filterForMeal = {
    "isGlutenFree": false,
    "isLactoseFree": false,
    "isVegan": false,
    "isVegetarian": false,
  };

  List<Meal> mealingFilter = DUMMY_MEALS;
  List<Meal> mealingFavourite = [];

  void chooseFavouriteMeal(String id){
   final indexMeal= mealingFavourite.indexWhere((meal) => meal.id == id);
   
   if(indexMeal >=0){
     mealingFavourite.removeWhere((meal)=> meal.id == id);
   }else{
     setState(() {
       mealingFavourite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
     });
   }
  }
  bool isFavourite(String id){
  return  mealingFavourite.any((meal) {return meal.id == id;});
  }

  void filterMeal(Map<String, dynamic> filterForMealData) {
    setState(() {
      filterForMeal = filterForMealData;
      mealingFilter.where((meal) {
        if (filterForMeal["isGlutenFree"] && !meal.isGlutenFree) return false;
        if (filterForMeal["isLactoseFree"] && !meal.isLactoseFree) return false;
        if (filterForMeal["isVegan"] && !meal.isVegan) return false;
        if (filterForMeal["isVegetarian"] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => TabView(mealingFavourite),
        MealView.nameRoute: (context) => MealView(mealingFilter),
        MealDetailsView.nameRoute: (context) => MealDetailsView(chooseFavouriteMeal,isFavourite),
        FilterView.nameRoute: (context) => FilterView(filterForMeal,filterMeal),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.redAccent,
        canvasColor: Color.fromRGBO(255, 254, 200, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 24.0, fontFamily: "roboto"),
              body1: TextStyle(),
              body2: TextStyle(),
            ),
      ),
    );
  }
}
