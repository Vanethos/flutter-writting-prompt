import 'package:writing_prompt/data/local/database/prompt_provider.dart';

class PromptLocal {
  int id;
  String prompt;
  bool done;

  PromptLocal(this.id, this.prompt, this.done);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: prompt,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  PromptLocal.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    prompt = map[columnTitle];
    done = map[columnDone] == 1;
  }
}