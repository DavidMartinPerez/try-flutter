import 'package:flutter/material.dart';

// import 'package:componentes_app_demo/src/pages/home_temp.dart';
import 'package:componentes_app_demo/src/pages/home.dart';
import 'package:componentes_app_demo/src/pages/alert.dart';
import 'package:componentes_app_demo/src/pages/avatar.dart';
import 'package:componentes_app_demo/src/pages/card.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}

MaterialPageRoute<AlertPage> Function( RouteSettings routeSettings ) getUrlNotFound() {
  return ( RouteSettings routeSettings ) {
        print('Url not found');
        //TODO: Cambiar porr URL 404
        return MaterialPageRoute( builder: ( BuildContext contenxt ) => AlertPage() );
    };
}