import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/circular-area');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'Penghitung Luas Lingkaran',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/products');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'Products',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/todolist');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'Todo List',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/users');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'User',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/product-detail');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'Product Detail',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
