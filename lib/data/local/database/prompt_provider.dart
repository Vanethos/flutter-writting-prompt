import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:writing_prompt/data/local/model/prompt_local.dart';

final String tablePrompt = 'prompt';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

class DBHelper {
  Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "test.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tablePrompt ( 
              $columnId integer primary key autoincrement, 
              $columnTitle text not null,
              $columnDone integer not null)
            ''');
        });
  }

  Future<int> insert(PromptLocal prompt) async {
    var dbClient = await db;
    return await dbClient.insert(tablePrompt, prompt.toMap());
  }

  Future<List<PromptLocal>> getPrompts() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tablePrompt);
    List<PromptLocal> prompts =List<PromptLocal>();
    for (var value in maps) {
      prompts.add(PromptLocal.fromMap(value));
    }
    return prompts;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tablePrompt, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(PromptLocal prompt) async {
    var dbClient = await db;
    return await dbClient.update(tablePrompt, prompt.toMap(),
        where: '$columnId = ?', whereArgs: [prompt.id]);
  }

  Future close() async {
    await db
        ..close();
  }
  
  DBHelper();
}