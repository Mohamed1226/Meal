import 'package:flutter/material.dart';
import 'package:hasmealapp/view/meal_view.dart';
class CustomCategory extends StatelessWidget {
  final String id ,title;
  final Color color;

  CustomCategory(this.id, this.title, this.color);

  void navigatorToMealView(BuildContext context){
    Navigator.of(context).pushNamed(MealView.nameRoute,
    arguments: {
      "id":id,
      "title":title
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      splashColor: Colors.purpleAccent,
      onTap: ()=>navigatorToMealView(context),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
        ),
          child: Text(title, style: Theme.of(context).textTheme.title,),
      ),
    );
  }
}
