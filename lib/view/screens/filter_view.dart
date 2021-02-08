import 'package:flutter/material.dart';
import 'package:hasmealapp/view/custom_widget/main_drawer.dart';


class FilterView extends StatefulWidget {
  static const String nameRoute = "/filter_view";
  final Function filterMeal;
final Map filterForMeal;
  FilterView(this.filterForMeal,this.filterMeal);


  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  Widget buildSwitchListTitle(String text, String subtitle, Function fan,
      bool isveget) {
    return SwitchListTile(
        title: Text(text, style: Theme
            .of(context)
            .textTheme
            .title,),
        subtitle: Text(subtitle),
        value: isveget, onChanged: fan);
  }

  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;


  @override
  void initState() {
    isGlutenFree=   widget.filterForMeal["isGlutenFree"] ;
    isLactoseFree=  widget.filterForMeal["isLactoseFree"]  ;
    isVegan=  widget.filterForMeal["isVegan"] ;
    isVegetarian= widget.filterForMeal["isVegetarian"] ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Choose your favourite Category"),),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text("Filtering for your meal", style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 25.0
            ),),
          ),
          buildSwitchListTitle(
              "GlutenFree", "Only include GlutenFree",
                  (v) {
                setState(() {
                  isGlutenFree = v;
                });
              }, isGlutenFree
          ),
          buildSwitchListTitle(
              "LactoseFree", "Only include LactoseFree",
                  (v) {
                setState(() {
                  isLactoseFree = v;
                });
              }, isLactoseFree
          ),
          buildSwitchListTitle(
              "Vegan", "Only include VeganFree",
                  (v) {
                setState(() {
                  isVegan = v;
                });
              }, isVegan
          ),
          buildSwitchListTitle(
              "Vegetarian", "Only include Vegetarian",
                  (v) {
                setState(() {
                  isVegetarian = v;
                });
              }, isVegetarian
          ),

          SizedBox(height: 40.0,),
          RaisedButton(onPressed: () {
            Map<String, dynamic> filterForMeal = {
              "isGlutenFree": isGlutenFree,
              "isLactoseFree": isLactoseFree,
              "isVegan": isVegan,
              "isVegetarian": isVegetarian,
            };
          return  widget.filterMeal(filterForMeal);
          }, child: Text("Save"), color: Colors.purple,),
        ],
      ),
    );
  }
}
