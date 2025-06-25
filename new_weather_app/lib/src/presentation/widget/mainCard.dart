import 'package:flutter/material.dart';
import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class main_card extends StatelessWidget {
  const main_card({super.key, required this.model});
  final weatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: Color(0xFF7FBDCA),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 182, 3, 122), // بنفسجي
            Color.fromARGB(255, 71, 3, 182), // أزرق
          ],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [
              SizedBox(height:6,),
              defulttext(data: "Wind", fSize: 22),
              defultcardRow(number: "${model.maxwind_mph.toInt()}", mark: " km/h", markfSize: 20),
            ],
          ),
          VerticalDivider(),
          Column(
            children: [
              defulttext(data: "Temp", fSize: 22),
              defultcardRow(number:"${model.avgtemp_c.toInt()}", mark: "°C", markfSize: 25),
            ],
          ),
          VerticalDivider(),

          Column(
            children: [
              defulttext(data: "Hunidity", fSize: 22),
              defultcardRow(number: "${model.avghumidity.toInt()}", mark: " %", markfSize: 23),
            ],
          ),
          SizedBox(width: 1),
        ],
      ),
    );
  }
}
