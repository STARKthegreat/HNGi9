import 'package:countriesapp/model/list_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<ListModel>?> getCountries() async {
    var client = http.Client();

    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return listModelFromJson(json);
    }
    return null;
  }
}
