import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteexample/DBHelpers/DBHelper.dart';
import 'package:sqfliteexample/UIWedgits/MyListViewItem.dart';

class AllNote extends StatefulWidget{
  @override
  State<AllNote> createState() => _AllNoteState();
}

class _AllNoteState extends State<AllNote> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: DBHelper.dbHelper.getAllQuestions(),
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