import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaweather_client/core/utils/app_date_utils.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/keys/forecast_list_item_keys.dart';

class ForecastListItem extends StatelessWidget {
  final DayForecast dayForecast;
  final String unit;
  const ForecastListItem({Key key, @required this.dayForecast, this.unit = 'C'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String day = AppDateUtils.getAbbrDayName(dayForecast.date);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(fontWeight: FontWeight.bold),
            key: Key(ForecastListItemKeys.DAY_ABBR_KEY),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: dayForecast.imageUrl.isNotEmpty
                ? SvgPicture.network(
                    dayForecast.imageUrl,
                    height: 50,
                  )
                : Container(
                    height: 50,
                  ),
          ),
          Text(
            _getTempView(),
            style: TextStyle(fontWeight: FontWeight.bold),
            key: Key(ForecastListItemKeys.TEMP_TEXT_KEY),
          ),
        ],
      ),
    );
  }

  String _getTempView() {
    return '${dayForecast.minTemp.toStringAsFixed(0)}/${dayForecast.maxTemp.toStringAsFixed(0)} $unit';
  }
}
