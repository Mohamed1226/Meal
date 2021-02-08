import 'package:flutter/material.dart';
import 'package:hasmealapp/model/meal_model.dart';
import 'package:hasmealapp/view/custom_widget/custom_meal.dart';

import '../dummy_data.dart';

class MealView extends StatefulWidget {
  static const nameRoute = "meal_view";
final List<Meal> meals;

  MealView(this.meals);

  @override
  _MealViewState createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {


  String categoryId,categoryTitle;
  List<Meal> categoryMeals;
@override
  void didChangeDependencies() {
  final data = ModalRoute.of(context).settings.arguments as Map;
   categoryId = data["id"];
   categoryTitle = data["title"];

   categoryMeals = widget.meals.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
    super.didChangeDependencies();
  }

//  void _removeItem(String id){
//   setState(() {
//     categoryMeals.removeWhere((meal) => meal.id==id);
//   });
//  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CustomMeal(
               //  removeItem: _removeItem,
          id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
