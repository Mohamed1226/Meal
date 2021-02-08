import 'package:flutter/material.dart';
import 'package:hasmealapp/dummy_data.dart';
import 'package:hasmealapp/model/meal_model.dart';

class MealDetailsView extends StatelessWidget {
  final Function chooseFavouriteMeal,isFavourite;

  MealDetailsView(this.chooseFavouriteMeal, this.isFavourite);

  static const String nameRoute = "/Meal/details/view";

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
     final meal =DUMMY_MEALS.firstWhere((meal)=>id == meal.id );

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          FlatButton.icon(onPressed: (){
            Navigator.of(context).pop(id);
          }, icon: Icon(Icons.delete), label: Text("Delete"),),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(meal.imageUrl,fit: BoxFit.fill,),

          ),
          buildSectionTitle("Ingredients", context),
         buildSection(context, meal.ingredients) ,
          buildSectionTitle("Steps", context),
          buildSection(context, meal.steps) ,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.5),
        child: Icon(isFavourite(id)?Icons.favorite:Icons.favorite_border,color: Colors.red,),
        onPressed: (){
          chooseFavouriteMeal(id);
        },
      ),
    );
  }
  
  Widget buildSectionTitle(String text ,BuildContext con){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(6.0),
      child: Text(text,style: Theme.of(con).textTheme.title,),
    );
  }
  Widget buildSection(BuildContext context, List meal){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Colors.purpleAccent),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      width: 300,
      height: 150,
      child: ListView.builder(itemBuilder: (con,index){
        return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(meal[index]),
            ));
      },itemCount: meal.length,),
    ) ;
  }
}
