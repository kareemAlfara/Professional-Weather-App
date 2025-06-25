import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/presentation/widget/todaylistview.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class TodayForecastScreen extends StatelessWidget {
  const TodayForecastScreen({
    super.key,
    required this.model,
    required this.temps,
    required this.text,
  });
  final List<double> temps;
  final List<String> text;
  final weatherModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Today Forecasting"),
        centerTitle: true,
        leading: const BackButton(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daily Statistics",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  //  خطوط العرضية الداخلية
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: true,
                    // horizontalInterval: 5, // Optional: space between Y grid lines
                    verticalInterval:
                        10, // Optional: space between X grid lines
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.5),
                        strokeWidth: 2,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text(
                                timeSrting[0],
                                style: TextStyle(color: Colors.white),
                              );
                            case 10:
                              return Text(
                                timeSrting[1],
                                style: TextStyle(color: Colors.white),
                              );
                            case 20:
                              return Text(
                                timeSrting[2],
                                style: TextStyle(color: Colors.white),
                              );
                            case 30:
                              return Text(
                                timeSrting[3],
                                style: TextStyle(color: Colors.white),
                              );
                            case 40:
                              return Text(
                                timeSrting[4],
                                style: TextStyle(color: Colors.white),
                              );
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            "${value.toInt()}°",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, temps[0]),
                        FlSpot(10, temps[1]),
                        FlSpot(20, temps[2]),
                        FlSpot(30, temps[3]),
                        FlSpot(40, temps[4]),
                      ],
                      isCurved: true,
                      color: Colors.purpleAccent,
                      barWidth: 4,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.purpleAccent.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          if (spot == const FlSpot(20, 5)) {
                            // Highlight this main point with white circle
                            return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.white,
                              strokeWidth: 3,
                              strokeColor: Colors.purpleAccent,
                            );
                          } else {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: Colors.purpleAccent,
                              strokeWidth: 0,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: temps.length,
                itemBuilder: (BuildContext context, int index) {
                  return WeatherCard(
                    temps: temps,
                    text: text,
                    model: model,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final List<double> temps;
  final List<String> text;
  final weatherModel model;
  final int index;
  const WeatherCard({
    super.key,
    required this.temps,
    required this.text,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C44),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(WeatherImage(text[index]), height: 25, width: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text[index], style: const TextStyle(fontSize: 16)),
          ),
          Text('${temps[index]}°C', style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 12),
          Text(
            timeSrting[index],
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
