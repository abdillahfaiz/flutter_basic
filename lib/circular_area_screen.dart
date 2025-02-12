import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircularAreaScreen extends StatefulWidget {
  const CircularAreaScreen({super.key});

  @override
  State<CircularAreaScreen> createState() => _CircularAreaScreenState();
}

class _CircularAreaScreenState extends State<CircularAreaScreen> {
  final jariJariController = TextEditingController();
  double result = 0;

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Luas Lingkaran"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: jariJariController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Jari Jari',
                hintText: "Input Jari Jari",
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = pi *
                      int.parse(jariJariController.text) *
                      int.parse(jariJariController.text);
                });
              },
              child: Text('Hitung'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text('Hasilnya adalah ${result.toStringAsFixed(2)}'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                ).then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        dateTime = value;
                      });
                    }
                  },
                );
              },
              child: Text("Pilih Tanggal"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text('Tanggal Yang kamu pilih \n $dateTime'),
          ],
        ),
      ),
    );
  }
}
