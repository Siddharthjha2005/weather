import 'package:flutter/widgets.dart';
import 'package:weather/models/hourly_model.dart';
import 'package:weather/models/suggestion_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/api_service.dart';

import '../models/daywise_model.dart';

class ProviderService extends ChangeNotifier{

  late List<WeatherModel> _weatherData = [];
  late List<HourlyModel> _hourlyData = [];
  late List<DayWiseModel> _dayWiseData = [];
  late List<SuggestionModel> _suggestionsData = [];

  // get value
  List<WeatherModel> weatherData() => _weatherData;
  List<HourlyModel> hourlyData() => _hourlyData;
  List<DayWiseModel> dayWiseData() => _dayWiseData;
  List<SuggestionModel> suggestionsData() => _suggestionsData;

  // event 
  Future<void> getWeather({String city="Mumbai"}) async{
    try {
      _weatherData = [];
      var data = await ApiService().getWeather(city: city);
      _weatherData.add(WeatherModel(cityName: data["city"]["name"], dayDate:
      data["list"][0]["dt_txt"],
          weatherIcon: data["list"][0]["weather"][0]["icon"], temp:
          data["list"][0]["main"]["temp"], desc:
          data["list"][0]["weather"][0]["description"],
          feelTemp:
          data["list"][0]["main"]["feels_like"], highTemp:
          data["list"][0]["main"]["temp_max"], lowTemp:
          data["list"][0]["main"]["temp_min"], humidity: data["list"][0]["main"]["humidity"], wind:
          data["list"][0]["wind"]["speed"], pressure:
          data["list"][0]["main"]["pressure"], sunrise: data["city"]["sunrise"], sunset: data["city"]["sunset"]));
      notifyListeners();
    } catch (e) {
      print("Error on Provider_weather: $e");
    }
  }
  
  // Hourly forecast
  Future<void> getHourly({String city="Mumbai"}) async{
    try {
      _hourlyData = [];
      var data = await ApiService().getHourly(city: city);
      data.forEach((hour){
        _hourlyData.add(HourlyModel(time: hour["dt_txt"], weatherIcon:
        hour["weather"][0]["icon"], temp: hour["main"]["temp"]));
      });
      notifyListeners();
    } catch (e) {
      print("Error on Provider_Hourly: $e");
    }
  }

  // day wise
  Future<void> getDayWise({String city="Mumbai"}) async{
    try {
      _dayWiseData = [];
      var data = await ApiService().getDayWise(city: city);
      data.forEach((day){
        var dateTime = DateTime.parse(day["dt_txt"]);
        int date = dateTime.day;
        if(day["dt_txt"] == "2026-04-$date 12:00:00"){
          _dayWiseData.add(DayWiseModel(day: day["dt_txt"], weatherIcon:
          day["weather"][0]["icon"], temp: day["main"]["temp"], desc:
          day["weather"][0]["description"]));
          date++;
        }
      });
      notifyListeners();
    } catch (e) {
      print("Error on Provider_dayWise: $e");
    }
  }

  // suggestions
  Future<void> getSuggestions({required String city}) async{
    try {
      _suggestionsData = [];
      var data = await ApiService().getSuggestions(city: city);
      data.forEach((d){
        _suggestionsData.add(SuggestionModel(cityName: d["name"],state:
        d["state"],country: d["country"]));
      });
      notifyListeners();
    } catch (e) {
      print("Error on Provider_suggestions: $e");
    }
  }


}