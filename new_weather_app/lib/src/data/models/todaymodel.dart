class Todaymodel {
  final double temp1;
  final String text1;
  final double temp2;
  final String text2;
  final double temp3;
  final String text3;
  final double temp4;
  final String text4;
  final double temp5;
  final String text5;

  Todaymodel({
    required this.temp1,
    required this.text1,
    required this.temp2,
    required this.text2,
    required this.temp3,
    required this.text3,
    required this.temp4,
    required this.text4,
    required this.temp5,
    required this.text5,
  });

  factory Todaymodel.fromJson(json) {
    return Todaymodel(
      text1: json["forecast"]["forecastday"][0]["hour"][0]["condition"]["text"],
      temp1: json["forecast"]["forecastday"][0]["hour"][0]['temp_c'],

      text2: json["forecast"]["forecastday"][0]["hour"][3]["condition"]["text"],
      temp2: json["forecast"]["forecastday"][0]["hour"][3]['temp_c'],
      text3: json["forecast"]["forecastday"][0]["hour"][7]["condition"]["text"],
      temp3: json["forecast"]["forecastday"][0]["hour"][7]['temp_c'],
      text4: json["forecast"]["forecastday"][0]["hour"][11]["condition"]["text"],
      temp4: json["forecast"]["forecastday"][0]["hour"][11]['temp_c'],
      text5: json["forecast"]["forecastday"][0]["hour"][17]["condition"]["text"],
      temp5: json["forecast"]["forecastday"][0]["hour"][17]['temp_c'],
    );
  }
}
