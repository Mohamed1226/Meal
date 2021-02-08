import 'package:flutter/material.dart';
import 'package:hasmealapp/model/meal_model.dart';
import 'package:hasmealapp/view/custom_widget/custom_meal.dart';

class FavouriteView extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteView(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(child: Text(" No Favourite Meal You Add ! "),);
    } else {
      return ListView.builder(itemCount: favouriteMeal.length,
          itemBuilder: (context, index) {
            return CustomMeal(
                //removeItem: _removeItem,
                id: favouriteMeal[index].id,
                title: favouriteMeal[index].title,
                imageUrl: favouriteMeal[index].imageUrl,
                duration: favouriteMeal[index].duration,
                complexity: favouriteMeal[index].complexity,
                affordability: favouriteMeal[index].affordability);
          });
    }
  }
}