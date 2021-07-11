import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/forecast/presentation/bloc/forecast_bloc.dart';
import 'features/forecast/presentation/ui/forecast_screen.dart';
import 'injection.dart';

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ForecastScreen.routeName,
      routes: {
        ForecastScreen.routeName: (context) => BlocProvider.value(
              value: getIt<ForecastBloc>(),
              child: ForecastScreen(),
            )
      },
    );
  }
}