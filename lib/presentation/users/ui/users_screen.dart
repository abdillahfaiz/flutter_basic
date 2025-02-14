import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/users/provider/user_provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Consumer<UserProvider>(builder: (_, state, __) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ListTile(  
                leading: Image.network(state.data[index]['avatar']),
                title: Text(state.data[index]['name']),
                subtitle: Text(state.data[index]['email']),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            },
          );
        }
      }),
    );
  }
}
