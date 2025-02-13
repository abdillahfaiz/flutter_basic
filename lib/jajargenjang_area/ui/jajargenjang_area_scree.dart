import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/jajargenjang_area/provider/jajargenjang_model.dart';

class JajargenjangAreaScreen extends StatefulWidget {
  const JajargenjangAreaScreen({super.key});

  @override
  State<JajargenjangAreaScreen> createState() => _JajargenjangAreaScreenState();
}

class _JajargenjangAreaScreenState extends State<JajargenjangAreaScreen> {
  final alasController = TextEditingController();
  final tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('Luas Jajar Genjang'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://fpjm.or.id/cdn/featured/rumus-luas-jajar-genjang.webp',
                  width: 350,
                )),
            TextField(
              controller: alasController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'Alas', hintText: 'Input Alas (cm)'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'Tinggi', hintText: 'Input Tinggi (cm)'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<JajargenjangModel>(context, listen: false)
                      .calculate(int.parse(alasController.text),
                          int.parse(tinggiController.text));
                },
                child: Text('Hitung')),
            SizedBox(
              height: 20,
            ),
            Consumer<JajargenjangModel>(
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
