import 'package:advanced_1/app/dependancy_incjection.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}