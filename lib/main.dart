import 'package:flutter/material.dart';
import 'package:udemy_course2/src/pages/alert_page.dart';
import 'package:udemy_course2/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //home: HomePage(),
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>AlertPage()
        ); 
      }
    );
  }
}