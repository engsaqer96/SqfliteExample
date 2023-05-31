import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteexample/DBHelpers/DBHelper.dart';
import 'package:sqfliteexample/UIWedgits/MyListViewItem.dart';

class CompleteNotes extends StatefulWidget{
  @override
  State<CompleteNotes> createState() => _CompleteNotesState();
}

class _CompleteNotesState extends State<CompleteNotes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: DBHelper.dbHelper.getAllUCQuestions(1),//1=complete
        builder: (context, snapshot) {
          var list=snapshot.data;
          return ListView.builder(itemCount: list?.length??0,
            itemBuilder: (context, index) {
              return MyListViewItem(list?[index].is_complete,list?[index].des);
            },);
        },
      ),
    );
  }
}