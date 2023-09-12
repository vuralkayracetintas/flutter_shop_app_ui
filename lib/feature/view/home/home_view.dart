import 'package:flutter/material.dart';
import 'package:flutter_shop_app/feature/view/cart/cart_view.dart';
import 'package:flutter_shop_app/feature/view/item/item_view_model.dart';
import 'package:flutter_shop_app/product/constans/string_constans.dart';
import 'package:flutter_shop_app/product/model/cart_model.dart';
import 'package:flutter_shop_app/product/theme/theme_provider.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var greeting = ""; // Varsayılan karşılama mesajı
    StringConstants stringConstants = const StringConstants();

    if (now.hour >= 5 && now.hour < 12) {
      greeting = stringConstants.gretingMorning;
    } else if (now.hour >= 13 && now.hour < 18) {
      greeting = stringConstants.gretingAfternoon;
    } else if (now.hour >= 18 && now.hour < 22) {
      greeting = stringConstants.gretingEvening;
    } else {
      greeting = stringConstants.gretingNight;
    }

    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: provider.toogleTheme,
            icon: Icon(
              provider.themeData == ThemeData.dark(useMaterial3: true)
                  ? Icons.brightness_7_rounded
                  : Icons.brightness_4_sharp,
            ),
          )
        ],
      ),
      body: Padding(
        padding: context.padding.low,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greeting),
            Text(
              stringConstants.homeTitle,
              style: context.general.textTheme.headlineLarge,
            ),
            Text(
              stringConstants.homeSubtitle,
              style: context.general.textTheme.bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: context.sized.height * 0.25,
              child: Consumer<CartModel>(
                builder: (context, ref, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ref.shopItems.length,
                    itemBuilder: (context, index) {
                      return ItemModel(
                        itemName: ref.shopItems[index][0],
                        itemPrice: ref.shopItems[index][1],
                        itemPath: ref.shopItems[index][2],
                        color: ref.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            const Expanded(child: CartView())
          ],
        ),
      ),
    );
  }
}
