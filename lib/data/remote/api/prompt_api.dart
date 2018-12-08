import 'package:writing_prompt/data/remote/model/prompt_remote.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class PromptApi {
  Future<PromptRemote> fetchPrompt() async {
    final response = await http.get('https://ineedaprompt.com/dictionary/default/prompt?q=adj+noun+adv+verb+noun+location');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return fromJson(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}


