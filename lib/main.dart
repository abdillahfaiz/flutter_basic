import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/circular_area/provider/circular_model.dart';
import 'package:todo_list/presentation/circular_area/ui/circular_area_screen.dart';
import 'package:todo_list/presentation/jajargenjang_area/provider/jajargenjang_model.dart';
import 'package:todo_list/presentation/jajargenjang_area/ui/jajargenjang_area_scree.dart';
import 'package:todo_list/presentation/menu_screen.dart';
import 'package:todo_list/presentation/product_detail/provider/product_provider.dart';
import 'package:todo_list/presentation/product_detail/ui/product_detail_screen.dart';
import 'package:todo_list/presentation/products/provider/products_provider.dart';
import 'package:todo_list/presentation/products/ui/products_screen.dart';
import 'package:todo_list/presentation/rectangular_area/provider/rectangular_model.dart';
import 'package:todo_list/presentation/rectangular_area/ui/rectangular_area_screen.dart';
import 'package:todo_list/presentation/todolist/provider/todolist_model.dart';
import 'package:todo_list/presentation/todolist/ui/todolist_screen.dart';
import 'package:todo_list/presentation/users/ui/users_screen.dart';
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
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RectangularModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => JajargenjangModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
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
        '/todolist': (context) => TodolistScreen(),
        '/products': (context) => ProductsScreen(),
        '/users': (context) => UsersScreen(),
        '/rectangular-area': (context) => RectangularAreaScreen(),
        '/jajar-genjang': (context) => JajargenjangAreaScreen(),
        '/product-detail': (context) => ProductDetailScreen()
      },
    );
  }
}
