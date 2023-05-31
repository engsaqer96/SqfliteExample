import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListViewItem extends StatefulWidget{
  int? is_complete;
  String? des;
  MyListViewItem(this.is_complete,this.des);

  @override
  State<MyListViewItem> createState() => _MyListViewItemState(is_complete);
}

class _MyListViewItemState extends State<MyListViewItem> {

  int? is_complete_x;
  bool? flag;

  _MyListViewItemState(int? is_complete){
    this.flag=is_complete==0?false:true;
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
   return Card(
     margin: EdgeInsets.all(10),
     color: flag??false?Colors.greenAccent:Colors.redAccent,
     child: Row(
       children: [
         Expanded(child: Text(widget.des!,textAlign: TextAlign.center,)),
         Checkbox(value: flag??false, onChanged: (value) {
           flag=value;
           setState(() {
           });
         },)
       ],
     ),

   );
  }
}