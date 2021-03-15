import 'package:flutter/material.dart';
import 'package:udemy_course2/src/pages/Animated_container.dart';
import 'package:udemy_course2/src/pages/alert_page.dart';
import 'package:udemy_course2/src/pages/avatart_page.dart';
import 'package:udemy_course2/src/pages/card_page.dart';
import 'package:udemy_course2/src/pages/home_page.dart';


Map<String,WidgetBuilder> getAplicationRoutes(){
  return <String,WidgetBuilder>{
    '/' : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage()
    
  };
}