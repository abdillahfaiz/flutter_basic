import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/products/provider/products_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductsProvider>().getProducts();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(builder: (context, state, widget) {
        return state.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index]['title']),
                    subtitle: Text(state.data[index]['description']),
                  );
                },
                itemCount: state.data.length,
              );
      }),
    );
  }
}
