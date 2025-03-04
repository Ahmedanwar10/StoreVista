import 'package:flutter/material.dart';
import 'package:store_vista/app/dependancy_incjection.dart';

import 'app/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}