String baseUrl = "https://api.weatherapi.com/v1/forecast.json";
String getWeatherByLocationUrl({required double lat,required double lon}) {
  return '$baseUrl?key=cd321da97aac408f8fc125209231109&q=$lat,$lon&aqi=no&alert=no';
}

String getWeatherByCityUrl(String cityName) {
  return '$baseUrl?key=cd321da97aac408f8fc125209231109&q=$cityName&aqi=no&alert=no';
}
