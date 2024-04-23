import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>?> makeApiCall(String prompt) async {
    print(prompt);
    final response = await http.post(
      Uri.parse('http://192.168.10.108:4000/askStory'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'text': prompt}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final image = responseData['image'];
      final text = responseData['text'];

      print('Response from server: ${responseData['image']}');
      return {"text": text, "image": image};
    } else {
      print('Failed to make API call: ${response.statusCode}');
      return null;
    }
  }

  // Future<Array> _getRandomStory() {}
}
