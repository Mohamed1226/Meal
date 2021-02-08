import 'package:flutter/material.dart';
import 'package:hasmealapp/dummy_data.dart';
import 'package:hasmealapp/view/custom_widget/cutom_category.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200.0,
        ),
        children: DUMMY_CATEGORIES.map((e) {
          return CustomCategory(e.id, e.title, e.color);
        }).toList(),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
