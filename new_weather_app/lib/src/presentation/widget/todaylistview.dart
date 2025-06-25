import 'package:flutter/material.dart';
import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/presentation/screens/todayForecast.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class todayListview extends StatefulWidget {
  const todayListview({super.key, required this.model});
  final weatherModel model;

  @override
  State<todayListview> createState() => _todayListviewState();
}

class _todayListviewState extends State<todayListview> {
  @override
  List<double>? temps;
  List<String>? texts;
  void initState() {
    // TODO: implement initState
     temps = [
      widget.model.temp1,
      widget.model.temp2,
      widget.model.temp3,
      widget.model.temp4,
      widget.model.temp5,
    ];
       texts = [
      widget.model.text1,
      widget.model.text2,
      widget.model.text3,
      widget.model.text4,
      widget.model.text5,
    
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defulttext(data: "Today", fSize: 20),
                  IconButton(
                    onPressed: () {
                      navigat(context, widget: TodayForecastScreen(model: widget.model, temps: temps!, text: texts!,));
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ),
                ],
              ),
          ),
        Container(
          height: 150,
        
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder:
                (context, index) => Container(
                  height: 150,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color:
                        false ? Colors.white.withOpacity(0.2) : Color(0xFF7FBDCA),
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
                  width: 84,
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      defulttext(data: timeSrting[index], fSize: 20),
                      SizedBox(height: 5),
                      Image.asset(WeatherImage(texts![index]), height: 55, width: 55),
                      SizedBox(height: 5),
                      defultcardRow(
                        number: "${temps![index].toInt()}",
                        mark: "c",
                        fSize: 22,
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 11);
            },
          ),
        ),
      ],
    );
  }
}

List<String> timeSrting = ["00:00", "04:00", "08:00", "12:00", "18:00"];
