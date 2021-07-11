import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/forecast_list_item.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/large_forecast_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ForecastScreen extends StatefulWidget {
  static String routeName='ForecastScreen';
  const ForecastScreen({Key key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  int _selectedIndex = 0;
  ForecastBloc _forecastBloc;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    _forecastBloc = BlocProvider.of<ForecastBloc>(context);
    _forecastBloc.getForecast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: () {
          _forecastBloc.getForecast();
        },
        child: BlocListener<ForecastBloc, ForecastState>(
          listener: (context, state) {
            if (state is ForecastSuccess || state is ForecastFailure)
              _refreshController.refreshCompleted();
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: BlocBuilder<ForecastBloc, ForecastState>(
              builder: (context, state) {
                if (state is ForecastSuccess) {
                  return _buildSuccessState(state);
                } else if (state is ForecastFailure) {
                  return _buildFailureState(state);
                }
                return Center(
                    child: Container(
                  child: CircularProgressIndicator(),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFailureState(ForecastFailure state) {
    return Column(
      children: [Text(state.msg)],
    );
  }

  Widget _buildSuccessState(ForecastSuccess state) {
    return Column(
      children: [
        Expanded(
          child: LargeForecastWidget(
              dayForecast: state.weatherForecast.daysForecasts[_selectedIndex]),
        ),
        _buildForecastList(state.weatherForecast.daysForecasts)
      ],
    );
  }

  Widget _buildForecastList(List<DayForecast> daysForecasts) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(0, 1))
        ], borderRadius: BorderRadius.circular(5), color: Colors.white),
        height: 170,
        padding: EdgeInsetsDirectional.only(top: 10),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: daysForecasts.length,
          itemBuilder: (context, index) => Material(
            color: Colors.white,
            child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: ForecastListItem(dayForecast: daysForecasts[index])),
          ),
        ),
      ),
    );
  }
}
