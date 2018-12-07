import 'package:test/test.dart';
import 'package:writing_prompt/data/model/prompt_remote.dart';

void main() {
  test("parses topstories.json", () {
    const name = "name";
    const count = 10;
    const jsonString =
        '{"english": "$name", "count": $count}';

    expect(fromJson(jsonString).english, name);
    expect(fromJson(jsonString).count, count);
  });
}