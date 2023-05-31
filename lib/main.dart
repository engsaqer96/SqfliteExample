import 'package:flutter/material.dart';
import 'package:sqfliteexample/DBHelpers/DBHelper.dart';
import 'package:sqfliteexample/UIScreen/ViewAllNotes.dart';

import 'UIScreen/HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDataBase();
  runApp(MaterialApp(
    routes: {
      '/':(context) => HomePage(),
      'view':(context) => ViewAllNotes()
    },
  ) );
}
