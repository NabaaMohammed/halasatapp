import 'package:flutter/material.dart';
import 'package:movie/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        routes: routes);
  }
}

