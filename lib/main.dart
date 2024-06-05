import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => Loading(),
      '/home': (BuildContext context) => Home(),
      '/location': (BuildContext context) => ChooseLocation(),
    },
  ));
}
