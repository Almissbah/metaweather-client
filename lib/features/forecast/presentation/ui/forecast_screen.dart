import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metaweather_client/core/ui/orientation_optional_widget.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/forecast_list_item.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/large_forecast_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'keys/forecast_screen_keys.dart';

class ForecastScreen extends StatefulWidget {
  static String routeName = 'ForecastScreen';
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
      key: Key(ForecastScreenKeys.SCAFOLD_KEY),
      backgroundColor: Colors.white,
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
        child: _buildBlocListener(),
      ),
    );
  }

  BlocListener<ForecastBloc, ForecastState> _buildBlocListener() {
    return BlocListener<ForecastBloc, ForecastState>(
      key: Key(ForecastScreenKeys.BLOC_LISTENER_KEY),
      listener: (context, state) {
        if (state is ForecastSuccess || state is ForecastFailure)
          _refreshController.refreshCompleted();
      },
      child: _buildBlocBuilder(),
    );
  }

  Container _buildBlocBuilder() {
    return Container(
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
    );
  }

  Widget _buildFailureState(ForecastFailure state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(state.msg,key: Key(ForecastScreenKeys.ERROR_MSG_KEY),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            key: Key(ForecastScreenKeys.RETRY_BUTTON_KEY),
              onPressed: () {
                _forecastBloc.getForecast();
              },
              child: Text('Retry')),
        )
      ],
    );
  }

  Widget _buildSuccessState(ForecastSuccess state) {
    var widgets = [
      Expanded(
        child: LargeForecastWidget(
            key: Key(ForecastScreenKeys.LARGE_FORECAST_WIDGT_KEY),
            dayForecast: state.weatherForecast.daysForecasts[_selectedIndex]),
      ),
      _buildForecastList(
          daysForecasts: state.weatherForecast.daysForecasts, axis: _getAxis())
    ];
    return OrientationOptionalWidget(
      portrait: Column(
        children: widgets,
      ),
      landscape: Row(
        children: widgets,
      ),
    );
  }

  Widget _buildForecastList(
      {List<DayForecast> daysForecasts, Axis axis = Axis.vertical}) {
    return Container(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20),
        child: Container(
          height: (axis == Axis.horizontal) ? 170 : null,
          padding: EdgeInsetsDirectional.only(top: 10),
          width: (axis == Axis.vertical) ? 170 : null,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 2, color: Colors.black26, offset: Offset(0, 1))
          ], borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: ListView.builder(
            key: Key(ForecastScreenKeys.FORECAST_LIST_KEY),
            scrollDirection: axis,
            itemCount: daysForecasts.length,
            itemBuilder: (context, index) => _getListItem(index, daysForecasts),
          ),
        ),
      ),
    );
  }

  Widget _getListItem(int index, List<DayForecast> daysForecasts) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: ForecastListItem(dayForecast: daysForecasts[index]),
        key: Key(ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_$index'),
      ),
    );
  }

  Axis _getAxis() {
    return (MediaQuery.of(context).orientation == Orientation.landscape)
        ? Axis.vertical
        : Axis.horizontal;
  }
}
