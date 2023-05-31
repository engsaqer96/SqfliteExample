import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteexample/DBHelpers/DBHelper.dart';
import 'package:sqfliteexample/Models/NoteModel.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String s='';
 bool? is_complete=false;
    var formKey= GlobalKey<FormState>();
    AutovalidateMode _autoValidate = AutovalidateMode.disabled;
    String? selectedValue = 'A';
    TextEditingController cq=TextEditingController()
    ,cq1=TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>back(),),

        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                  autovalidateMode: _autoValidate,
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if(value!.trim().isEmpty)
                            return "can't be empty";
                          return null;
                        },
                        controller: cq,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            label: Text('Title'),
                           ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if(value!.trim().isEmpty)
                              return "can't be empty";

                            return null;
                          },
                          controller: cq1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Description'),
                             ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Is Complete'),
                  SizedBox(width: 10,),
                  Checkbox(value: is_complete, onChanged: (value){
                    is_complete=value;
                    setState(() {

                    });
                  }),
                ],

              ),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(onPressed: addNewQuestion, child: Text('Add Question')))
            ],
          ),
        ),
      );
    }
    addNewQuestion() async {
      if(formKey.currentState!.validate()){
           NoteModel model=NoteModel(title: cq.text,des: cq1.text
           ,is_complete: (is_complete??false)?1:0);
          int? result =await DBHelper.dbHelper.insertNewNote(model);
          if((result??0)>0)
            Navigator.of(context).pushReplacementNamed('view');
      }else{
        setState(() => _autoValidate = AutovalidateMode.always);
      }

    }
  }

  Future<String> testasync() async {
    print('start');
    return await Future.delayed(Duration(seconds: 5),() =>'Order,,,,,,,,');

  }
