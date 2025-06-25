import 'package:flutter/material.dart';
import 'package:new_weather_app/src/presentation/screens/loadingScreen.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: defulitTextFormField(
              textcolor: Colors.white,
              onFieldSubmitted: (value) async{
              await  navigat(
                  context,
                  widget: Loadingscreen(fromPage: "city", cityName: value),
                );
              FocusScope.of(context).unfocus();
              },
              title: "Search ",
            ),
          ),
        ],
      ),
    );
  }
}
