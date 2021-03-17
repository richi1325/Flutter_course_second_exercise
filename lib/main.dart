import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:udemy_course2/src/pages/alert_page.dart';
import 'package:udemy_course2/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'MX'), 

      ],
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