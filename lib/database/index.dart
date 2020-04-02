import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//var db = await openDatabase('user_table.dn');

class  DbHelper {
final String _tableName = 'users_table';
Database _db = null;
Future<Database> get db async {
if(_db != null) return db;
_db = await _initDb();
return _db;
}
}

_initDb() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'users.db');
  var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  return db;
}

void _onCreate(Database db, int verson) async {
await db.execute("CREATE TABLE $_tableName("
    "id INTEGER PRIMARY KEY,"
    "name TEXT,"
    "sex TEXT)");
  print('create db');
}
