import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mad_practical/services/navigationService.dart';
import 'package:mad_practical/utils.dart';

void main() async {
  await setup();
  runApp(MainApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerServices();
}

class MainApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;

  MainApp({Key? key}) : super(key: key) {
    _navigationService = _getIt.get<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      routes: _navigationService.routes,
      initialRoute: '/',
    );
  }
}
