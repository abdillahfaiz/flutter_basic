import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/users/provider/user_provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState();
    //! Future microtask akan memanggil code di dalam nya ketika build widget nya selesai di bangun
    //! jika kita eksekusi tanpa Future.microtask maka UserProvider akan dipanggil sebelum UserProvider itu selesai di bangun maka akan terjadi error
    Future.microtask(() {
      context.read<UserProvider>().getDataUser();
    });
  }

  //! Cara lain ---------
  //! Atau cara lain kita bisa panggil provider getData User ny di method didChangeDependecies
  //! karena method didChangeDependencies akan dipanggil ketika UserProvider telah dibangun
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   context.read<UserProvider>().getDataUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).getDataUser();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (_, state, __) {
          //! loading checking--------------------
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
            //! error checking--------------------
          } else if (state.errorMessage != '') {
            return Text(state.errorMessage);
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
        },
      ),
    );
  }
}
