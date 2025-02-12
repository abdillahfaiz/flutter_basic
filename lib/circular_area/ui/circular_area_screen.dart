import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/circular_area/provider/circular_model.dart';

class CircularAreaScreen extends StatefulWidget {
  const CircularAreaScreen({super.key});

  @override
  State<CircularAreaScreen> createState() => _CircularAreaScreenState();
}

class _CircularAreaScreenState extends State<CircularAreaScreen> {
  final jariJariController = TextEditingController();

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
                Provider.of<CircularModel>(context, listen: false)
                    .calculate(double.parse(jariJariController.text));
              },
              child: Text('Hitung'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Consumer<CircularModel>(
              builder: (context, state, child) {
                return Text('Hasilnya adalah ${state.result}');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
