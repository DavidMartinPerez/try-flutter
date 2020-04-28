import 'package:flutter/material.dart';

// import 'package:componentes_app_demo/src/pages/home_temp.dart';
import 'package:componentes_app_demo/src/pages/home.dart';
import 'package:componentes_app_demo/src/pages/alert.dart';
import 'package:componentes_app_demo/src/pages/avatar.dart';
import 'package:componentes_app_demo/src/pages/card.dart';
import 'package:componentes_app_demo/src/pages/animated_container.dart';
import 'package:componentes_app_demo/src/pages/input.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
  };
}

MaterialPageRoute<AlertPage> Function( RouteSettings routeSettings ) getUrlNotFound() {
  return ( RouteSettings routeSettings ) {
        print('Url not found');
        //TODO: Cambiar porr URL 404
        return MaterialPageRoute( builder: ( BuildContext contenxt ) => AlertPage() );
    };
}