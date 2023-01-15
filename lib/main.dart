import 'package:flutter/material.dart';
import 'package:fuel_app/pages/home.dart';
import 'package:fuel_app/pages/model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider.value(value: FuelPriceModel()
        )
    ],
    child: MaterialApp(
    title: 'Fuel4U',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Fuel4U'),
    )
    );
  }
}
