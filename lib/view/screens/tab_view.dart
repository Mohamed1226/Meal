import 'package:flutter/material.dart';
import 'package:hasmealapp/model/meal_model.dart';
import 'package:hasmealapp/view/custom_widget/main_drawer.dart';
import 'package:hasmealapp/view/screens/favourite_view.dart';

import 'category_vew.dart';

class TabView extends StatefulWidget {
 final List<Meal> favouriteMeal;

  const TabView( this.favouriteMeal);
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

   List pages;

  int selectedIndexX=0;
 void selectedIndex(int value){
    setState(() {
      selectedIndexX=value;
    });
  }
  @override
  void initState() {
   pages=[
     {
       "page" :CategoryView(),"title" :"Category"
     },
     {
       "page" :FavouriteView(widget.favouriteMeal),"title" :"Favourite"
     },
   ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(pages[selectedIndexX]["title"]),
      ),
      body: pages[selectedIndexX]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purpleAccent,
        currentIndex: selectedIndexX,

        onTap: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("favorite")),
        ],
      ),
    );
  }
}
