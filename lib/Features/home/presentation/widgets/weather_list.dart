import 'package:flutter/cupertino.dart';
import 'package:myweather/Features/home/presentation/widgets/weather_item.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return WeatherItem();
      },
      itemCount: 5,
    );
  }
}
