import 'package:flutter/material.dart';
import 'package:flutter_shop_app/feature/view/cart/cart_view.dart';
import 'package:flutter_shop_app/feature/view/home/home_view.dart';
import 'package:flutter_shop_app/feature/view/intro/intropage_view.dart';
import 'package:flutter_shop_app/product/model/cart_model.dart';
import 'package:flutter_shop_app/product/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const IntroPage(),
        '/home': (BuildContext context) => const HomeView(),
        '/cart': (BuildContext context) => const CartView()
      },
      theme: themeChange.themeData,
    );
  }
}
