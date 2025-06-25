import 'package:flutter/material.dart';

Widget defultcardRow({
  required String number,
  required String mark,
  double? fSize = 48,
  double? markfSize,
}) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    defulttext(data: number, fSize: fSize, fw: FontWeight.bold),
    defulttext(data: mark, fSize: markfSize),
  ],
);
Future<dynamic> navigat(context, {required Widget widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
Widget defulttext({
  TextDirection? textDirection,
  required String data,
  double? fSize,
  Color? color,
  FontWeight? fw,
}) => Text(
  textDirection: textDirection,
  maxLines: 2,
  data,
  style: TextStyle(
    fontSize: fSize,
    color: color,
    fontWeight: fw,
  ).copyWith(overflow: TextOverflow.ellipsis),
);
Widget defulitTextFormField({
  int? maxline = 1,
  String? title,
  String? hintText,
  Widget? suffixIcon,
  Widget? label,
  Color? textcolor = Colors.black,
  // Color? bordercolor=Colors.white,
  Color bordercolor = Colors.black,
  void Function(String)? onChanged,
  TextInputAction? textInputAction,
  TextEditingController? controller,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
  void Function(String)? onchange,
  void Function(String)? onFieldSubmitted
}) => TextFormField(
  onFieldSubmitted:onFieldSubmitted ,
  keyboardType: keyboardType,
  maxLines: maxline,
  onChanged: onChanged,
  validator: validator,
  textInputAction: textInputAction,
  controller: controller,
  style: TextStyle(color: textcolor),
  decoration: InputDecoration(
    hintText: hintText,
    suffixIcon: suffixIcon,
    label: label,
    labelText: title,
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.black),
    ),
    // focusColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),

      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
);

String WeatherImage(String? condition) {
  final lower = condition?.toLowerCase();
  if (lower == null) {
    return "assets/stars.png";
  } else if ( lower.contains("clear")) {
    return "assets/clear.png";
  } else if (lower.contains("sunny") ) {
    return "assets/sunny1.png";
  }
   else if (lower.contains("partly cloudy")) {
    return "assets/cloudy.png";
  } else if (lower.contains("cloudy") || lower.contains("overcast")) {
    return "assets/cloudy.png";
  } else if (lower.contains("mist") ||
      lower.contains("fog") ||
      lower.contains("freezing fog")) {
    return "assets/stars.png";
  } else if (lower.contains("rain") ||
      lower.contains("drizzle") ||
      lower.contains("shower")) {
    return "assets/rain.png";
  } else if (lower.contains("snow") ||
      lower.contains("blizzard") ||
      lower.contains("sleet")) {
    return "assets/snow.png";
  } else if (lower.contains("thunder")) {
    return "assets/thunderstorm.png";
  } else if (lower.contains("ice pellets")) {
    return "assets/snow.png";
  } else {
    return "assets/stars.png";// default fallback
  }
}
