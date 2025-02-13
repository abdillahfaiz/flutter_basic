import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/rectangular_area/provider/rectangular_model.dart';

class RectangularAreaScreen extends StatefulWidget {
  const RectangularAreaScreen({super.key});

  @override
  State<RectangularAreaScreen> createState() => _RectangularAreaScreenState();
}

class _RectangularAreaScreenState extends State<RectangularAreaScreen> {
  final panjangController = TextEditingController();
  final lebarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Luas Persegi Panjang"),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'Panjang', hintText: 'Input Panjang (cm)'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration:
                  InputDecoration(labelText: 'Lebar', hintText: 'Input Lebar (cm)'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<RectangularModel>(context, listen: false)
                      .calculate(int.parse(panjangController.text),
                          int.parse(lebarController.text));
                },
                child: Text('Hitung')),
            SizedBox(
              height: 20,
            ),
            Consumer<RectangularModel>(
              builder: (context, state, child) {
                return Text('Hasilnya adalah ${state.result} cm²');
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
