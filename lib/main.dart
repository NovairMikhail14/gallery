import 'package:flutter/material.dart';
import 'package:gallery/app/app.dart';

import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}