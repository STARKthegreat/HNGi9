import 'dart:convert';
//import 'dart:html';

import 'package:countriesapp/model/list_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  var data = [];
  List<ListModel> result = [];

  Future<List<ListModel>?> getCountries() async {
    var client = http.Client();

    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(uri);

    response = await http.get(uri);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      result = data.map((e) => ListModel.fromJson(e)).toList();
      var iAmJson = response.body;
      return listModelFromMap(iAmJson);
    }
    return null;
  }
}
