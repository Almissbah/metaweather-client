import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metaweather_client/features/forecast/presentation/bloc/forecast_bloc.dart';

Widget getTestableWidget({@required Widget widget, Bloc bloc}) {
  return MaterialApp(
    home: bloc != null
        ? BlocProvider<ForecastBloc>(
            create: (context) => bloc,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Material(child: widget)),
          )
        : widget,
  );
}
