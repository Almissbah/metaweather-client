import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaweather_client/core/utils/app_date_utils.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/keys/large_forecast_widget_keys.dart';

class LargeForecastWidget extends StatelessWidget {
  final DayForecast dayForecast;
  final String unit;
  const LargeForecastWidget({
    Key key,
    @required this.dayForecast,
    this.unit = 'C',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            AppDateUtils.getDayOFweek(dayForecast.date),
            style: TextStyle(color: Colors.black, fontSize: 30),
            key: Key(LargeForecastWidgetKeys.DAY_TEXT_KEY),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 50, top: 20),
              child: Text(
                dayForecast.status,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                key: Key(LargeForecastWidgetKeys.STATUS_KEY),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: dayForecast.imageUrl.isNotEmpty
                    ? SvgPicture.network(
                        dayForecast.imageUrl,
                        height: 300,
                      )
                    : Container(
                        height: 300,
                      ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${dayForecast.temp.toStringAsFixed(0)} $unit',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                key: Key(LargeForecastWidgetKeys.TEMP_TEXT_KEY),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: _buildWeatherDetails(),
          ),
        ],
      ),
    );
  }

  _buildWeatherDetails() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getWeatherInfoItem(
              label: 'Humidity',
              value: '${dayForecast.humidity}',
              unit: '%',
              testKeySuffix: LargeForecastWidgetKeys.HUMIDITY_SUFFIX),
          _getWeatherInfoItem(
              label: 'Pressure',
              value: '${dayForecast.airPressure.toStringAsFixed(1)}',
              unit: 'hPa',
              testKeySuffix: LargeForecastWidgetKeys.PRESSURE_SUFFIX),
          _getWeatherInfoItem(
              label: 'Wind',
              value: '${dayForecast.windSpeed.toStringAsFixed(1)}',
              unit: 'km/h',
              testKeySuffix: LargeForecastWidgetKeys.WIND_SUFFIX),
        ],
      ),
    );
  }

  _getWeatherInfoItem(
      {@required String label,
      @required String value,
      String unit = '',
      @required String testKeySuffix}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Text(
            '$label : ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            key: Key(LargeForecastWidgetKeys.LABEL_KEY + testKeySuffix),
          ),
          Text(
            '$value',
            style: TextStyle(fontSize: 16),
            key: Key(LargeForecastWidgetKeys.VALUE_KEY + testKeySuffix),
          ),
          Text(
            ' $unit',
            style: TextStyle(
              fontSize: 16,
            ),
            key: Key(LargeForecastWidgetKeys.UNIT_KEY + testKeySuffix),
          ),
        ],
      ),
    );
  }
}
