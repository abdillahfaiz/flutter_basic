import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/circular_area/provider/circular_model.dart';
import 'package:todo_list/circular_area/ui/circular_area_screen.dart';
import 'package:todo_list/menu_screen.dart';
import 'package:todo_list/rectangular_area/ui/rectangular_area_screen.dart';
import 'package:todo_list/rectangular_area/provider/rectangular_model.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => CircularModel(),
    //   child: App()),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CircularModel()),
        ChangeNotifierProvider(create: (context) => RectangularModel()),
      ],
      child: const App(),
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
        '/rectangular-area': (context) => RectangularAreaScreen()
      },
    );
  }
}
