import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/data/repositories/location.dart';
import 'package:new_weather_app/src/data/repositories/weatherHelper.dart';
import 'package:new_weather_app/src/services/components/constance.dart';

class Weathercontroller {
  Weatherhelper _network(String url) {
    return Weatherhelper(url: url);
  }

  Future<dynamic> getWeatherByLocation() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    var response =
        await _network(
          getWeatherByLocationUrl(
            lat: currentLocation.latitude!,
            lon: currentLocation.longitude!,
          ),
        ).getWeather();
          weatherModel weathermodel = weatherModel.formJson(response);
    return weathermodel;
  }

  Future<dynamic> getWeatherByCityName({required cityName}) async {
    var response = await _network(getWeatherByCityUrl(cityName)).getWeather();
      weatherModel weathermodel = weatherModel.formJson(response);
    return weathermodel;
  }
}
