import 'package:flutter/widgets.dart';
import 'package:weather/models/hourly_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/api_service.dart';

import '../models/daywise_model.dart';

class ProviderService extends ChangeNotifier{

  final List<WeatherModel> _weatherData = [];
  final List<HourlyModel> _hourlyData = [];
  final List<DayWiseModel> _dayWiseData = [];

  // get value
  List<WeatherModel> getWeatherData() => _weatherData;
  List<HourlyModel> getHourlyData() => _hourlyData;
  List<DayWiseModel> getDayWiseData() => _dayWiseData;

  // event 
  Future<void> getWeather({String city="Mumbai"}) async{
    try {
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

}