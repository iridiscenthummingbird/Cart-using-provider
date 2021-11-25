import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_shop/my_provider.dart';
import 'package:provider_shop/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Shop"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Product>>(
          future: context.read<MyProvider>().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data!;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final product = list[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              product.title,
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: Text(product.description),
                            isThreeLine: true,
                            trailing: Text(
                              "${product.price}\$",
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<MyProvider>()
                                      .addProductToCart(product);
                                },
                                child: const Text(
                                  "Add to cart",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              product.image,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
