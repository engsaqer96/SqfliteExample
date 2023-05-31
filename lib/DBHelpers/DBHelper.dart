import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqfliteexample/Models/NoteModel.dart';
class DBHelper {
  final String _tableName='notes';
  final String _id='id';
  final String _title='title';
  final String _des='des';
  final String _isComplete='is_complete';

  DBHelper._();
  static DBHelper dbHelper=DBHelper._();
  Database? _db;
  initDataBase() async{
     String path=await getDatabasesPath();
     String db_path= join(path,'mydb.db');
     _db=await openDatabase(db_path,version: 2,onCreate:_onCreate,onUpgrade: _onUpgrade);
    
  }
  _onCreate(Database? db,int version)async{
    String sql='''
    create table $_tableName (
    $_id integer  primary key autoincrement,
    $_title varchar(50),
    $_des varchar(200),
    $_isComplete integer
    )
    ''';
    print(sql);
    await db?.execute(sql);

        print('table created **************************');
  }

  _onUpgrade(Database? db,int oldversion,int newVersion) {
    print('table updated **************************');
  }
  Future<int?> insertNewNote(NoteModel model) async{
    int? result=await _db?.insert(_tableName,model.toMap());
    // int? result=await _db?.rawInsert('insert into $_tableName ($_title,$_des,$_isComplete) '
    //     'values(?,?,?)',[model.title,model.des,model.is_complete]);
    return result;
  }

  Future<List<NoteModel>?> getAllQuestions() async{
   
    var list=await _db?.query(_tableName);//select * from table_name
    // var list=await _db?.rawQuery('select * from $_tableName');//select * from table_name
    return list?.map((e) => NoteModel.fromMap(e)).toList();
  }
  Future<List<NoteModel>?> getAllUCQuestions(int is_complete) async{

    var list=await _db?.query(_tableName,where: '$_isComplete=?'
        ,whereArgs: [is_complete]);//select * from table_name
    // var list=await _db?.rawQuery('select * from $_tableName');//select * from table_name
    return list?.map((e) => NoteModel.fromMap(e)).toList();
  }
  Future<int?> deleteNote(int id)async{
    var result=await _db?.delete(_tableName,where: '$_id=?',whereArgs: [id]);
    return result;
  }
  Future<int?> updateNote(int id,String is_complete)async{
    var result=await _db?.update(_tableName,{
      _isComplete:is_complete,
    },where: '$_id=?',whereArgs:[id]);
    return result;
  }
  //insert into table_name (id,name,age) values(?,?,?), 1,'ahmed',22)
  //insert(table_name,{'id':1,
// 'name':'ahmed',
// 'age':22})
}