import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/network/dio.dart';
import 'app/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  await di.init();
  runApp(MyApp());
}
