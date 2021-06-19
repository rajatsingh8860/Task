import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  fetchCategory() async {
    var uri = "https://project252.aaratechnologies.in/web/common/category";
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse["response_data"]["data"]);
    } else {
      print(response.statusCode);
      throw Exception("Failed to load data");
    }
  }
}
