import 'package:flutter/material.dart';
import 'package:hasmealapp/view/screens/filter_view.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
        children: [
        Container
        (
          height: 150,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(15.0),
    color: Colors.purple,
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text("Cooking !",style: TextStyle(
      fontSize: 35.0,fontWeight: FontWeight.w900,
      color: Colors.pink
      ),),
    ),
    ),
    buildListTitle((){
    Navigator.of(context).pushReplacementNamed(FilterView.nameRoute);
    },"Filtering",Icons.filter),
    buildListTitle((){
    Navigator.of(context).pushReplacementNamed("/");
    },"Meal",Icons.settings),
    ]
    ,
    ));
  }

  Widget buildListTitle(Function tabHandler, String text, IconData icon) {
    return ListTile(
      onTap: tabHandler,

      title: Text(
        text, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0,),),
      leading: Icon(icon),
    );
  }
}
