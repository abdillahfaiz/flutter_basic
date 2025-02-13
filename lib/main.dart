import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/jajargenjang_area/provider/jajargenjang_model.dart';
import 'package:todo_list/jajargenjang_area/ui/jajargenjang_area_scree.dart';
import 'package:todo_list/circular_area/provider/circular_model.dart';
import 'package:todo_list/circular_area/ui/circular_area_screen.dart';
import 'package:todo_list/menu_screen.dart';
import 'package:todo_list/rectangular_area/provider/rectangular_model.dart';
import 'package:todo_list/rectangular_area/ui/rectangular_area_screen.dart';
import 'package:todo_list/todolist/provider/todolist_model.dart';
import 'package:todo_list/todolist/ui/todolist_screen.dart';
// import 'package:todo_list/todolist/ui/todolist_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodolistModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CircularModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RectangularModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => JajargenjangModel(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/circular-area': (context) => CircularAreaScreen(),
        '/rectangular-area': (context) => RectangularAreaScreen(),
        '/todolist': (context) => TodolistScreen(),
        '/jajar-genjang': (context) => JajargenjangAreaScreen(),
      },
    );
  }
}
