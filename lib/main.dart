import 'package:calculadora/src/calc_page.dart';
import 'package:calculadora/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Provider.of<ThemeProvider>(context).themeData,
      // themeMode: ThemeMode.dark,

      // darkTheme: ThemeData.dark(
      //   useMaterial3: true,
      // ),

      // theme: ThemeData.light(
      //   useMaterial3: true,
      // ),

      home: const CalcPage(),
    );
  }
}
