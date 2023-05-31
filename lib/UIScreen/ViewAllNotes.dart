import 'package:flutter/material.dart';
import 'package:sqfliteexample/DBHelpers/DBHelper.dart';
import 'package:sqfliteexample/Models/NoteModel.dart';
import 'package:sqfliteexample/UIScreen/AllNote.dart';
import 'package:sqfliteexample/UIScreen/CompleteNotes.dart';

class ViewAllNotes extends StatefulWidget{
  @override
  State<ViewAllNotes> createState() => _ViewAllNotesState();
}

class _ViewAllNotesState extends State<ViewAllNotes> {
  List<NoteModel>? list=[];
 @override
  void initState() {
    DBHelper.dbHelper.getAllQuestions().then((value){
      list=value;
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Notes'),
          actions: [IconButton(
            onPressed: (){},
            icon: Icon(Icons.add),
          )],
          bottom:  TabBar(
            tabs: [
              Tab(text: 'All Notes',),
              Tab(text: 'Complete Notes',),
              Tab(text: 'UnComplete Notes',),
            ],
          ),
        ),
        body:
            TabBarView(
              children: [
                AllNote(),
              CompleteNotes(),
                Center(child: Icon(Icons.add_alarm_outlined ,size: 50),),
              ],
            )

      ),
    );
  }
}