import 'package:flutter/material.dart';
import 'package:flutter_shop_app/product/model/cart_model.dart';
import 'package:flutter_shop_app/product/theme/theme_provider.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: context.padding.low,
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.cartItems[index][3],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image(
                            image: AssetImage(value.cartItems[index][2]),
                          ),
                          title: Text(
                            value.cartItems[index][0],
                            style: context.general.textTheme.titleMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          subtitle: Text(
                            value.cartItems[index][1],
                            style: context.general.textTheme.titleMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding: context.padding.low,
                  child: Container(
                    height: context.sized.height * 0.1,
                    width: context.sized.width,
                    decoration: BoxDecoration(
                      color: provider.themeData ==
                              ThemeData.dark(useMaterial3: true)
                          ? Colors.grey[800]
                          : Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: context.padding.low,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: context.general.textTheme.labelLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$${value.calculateTotal()}',
                                style: context.general.textTheme.labelLarge
                                    ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: context.border.highBorderRadius),
                            child: Padding(
                              padding: context.padding.low,
                              child: const Row(
                                children: [
                                  Text('Pay Now'),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
