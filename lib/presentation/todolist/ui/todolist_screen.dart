import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/todolist/provider/todolist_model.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo list"),
        ),
        body: Column(children: [
          TextField(
            controller: todoController,
            decoration: InputDecoration(
              labelText: "Todo",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TodolistModel>(context, listen: false)
                  .addData(todoController.text);
              todoController.clear();
            },
            child: Text("Save"),
          ),
          Consumer<TodolistModel>(
            builder: (context, state, child) {
              return SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: state.todo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todo[index]),
                      onLongPress: () {
                        Provider.of<TodolistModel>(context, listen: false)
                            .removeData(index);
                      },
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<TodolistModel>(context, listen: false)
                              .removeData(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ]));
  }
}
