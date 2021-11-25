import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/my_provider.dart';
import 'package:provider_shop/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> list = context.read<MyProvider>().cart;
    String fullPrice = context.watch<MyProvider>().countFullPrice();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<MyProvider>().buy();
        },
        label: const Text(
          "Buy",
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Colors.pink,
      ),
      appBar: AppBar(
        title: Text("Cart : ${list.length} product" +
            (list.length != 1 ? "s" : "") +
            " - $fullPrice\$"),
      ),
      body: SafeArea(
        child: list.isNotEmpty
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(list[index].title),
                        trailing: Text(
                          "${list[index].price}\$",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  "You have empty cart.",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
