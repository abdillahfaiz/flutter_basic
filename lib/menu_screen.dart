import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/rectangular-area');
              },
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  child: Center(
                    child: Text(
                      'Penghitung Luas Persegi Panjang',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 24,
            // ),
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
          ],
        ),
      ),
    );
  }
}
