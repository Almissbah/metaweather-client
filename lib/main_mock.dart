import 'package:flutter/material.dart'; 
import 'app.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Env.test);
  runApp(MyApp());
}