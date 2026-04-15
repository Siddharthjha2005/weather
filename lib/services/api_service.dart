import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static final baseUrl = "https://api.openweathermap.org/";
  static final apiKey = "8efd253f694251ba2cf2daf6062a30de";

  // weather information
  Future<Map> getWeather({String city="Mumbai"}) async{
    var url = Uri.parse("${baseUrl}data/2"
        ".5/forecast?q=$city&appid=$apiKey&units=metric");
    try {
      final response = await http.get(url);
      if(response.statusCode==200){
        Map<String,dynamic> data = jsonDecode(response.body);
        return data;
      }
      else {
        print(response.statusCode);
        return {};
      }
    } catch (e) {
      print("Error on API_weather: $e");
      return {};
    }
  }

  // hourly information
  Future<List> getHourly({String city="Mumbai"}) async{
    var url = Uri.parse("${baseUrl}data/2"
        ".5/forecast?q=$city&appid=$apiKey&units=metric");
    try {
      final response = await http.get(url);
      if(response.statusCode==200){
        Map<String,dynamic> data = jsonDecode(response.body);
        return data['list'];
      }
      else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print("Error on API_hourly: $e");
      return [];
    }
  }

  // day wise
  Future<List> getDayWise({String city="Mumbai"}) async{
    var url = Uri.parse("${baseUrl}data/2"
        ".5/forecast?q=$city&appid=$apiKey&units=metric");
    try {
       final response = await http.get(url);
       if(response.statusCode == 200){
         Map<String,dynamic> data = jsonDecode(response.body);
         return data['list'];
       }
       else{
         print(response.statusCode);
         return [];
       }
    } catch (e) {
      print("Error on API_dayWise: $e");
      return [];
    }
  }

  Future<List> getSuggestions({required String city}) async{
    var url = Uri.parse("${baseUrl}geo/1"
        ".0/direct?q=$city&limit=5&appid=$apiKey");
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return data;
      }
      else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print("Error on API_suggestions: $e");
      return [];
    }
  }

  // // image
  // Future<void> getImage(String img) async{
  //   var url = Uri.parse("${baseUrl}img/wn/$img@2x.png");  // 1,2,4
  //   try {
  //     final response = await http.get(url);
  //     if(response.statusCode == 200){
  //
  //     }
  //     else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print("Error on image : $e");
  //   }
  // }

}