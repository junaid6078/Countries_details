import 'package:http/http.dart' as http;
import 'package:untitled/Models/CountriesModels.dart';

class RemoteServices{
  Future<CountriesModels> getCountry() async{
    var client = http.Client();
    var uri = Uri.parse("htttps://restcountries.com/v3.1/all");
    var response = await client.get(uri);
    return countriesModelsFromJson(response.body);
  }
}