import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/my_provider.dart';
import 'package:provider_shop/screens/cart_screen.dart';
import 'package:provider_shop/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
