// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ItemModel extends StatelessWidget {
  ItemModel({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.onPressed,
    this.color,
  }) : super(key: key);
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final color;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: context.sized.width * 0.4,
      decoration: BoxDecoration(
        color: color[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: context.padding.low,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(itemPath),
              ),
            ),
            Text(itemName,
                style: context.general.textTheme.labelLarge?.copyWith(
                  color: Colors.black,
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color[800],
              ),
              onPressed: onPressed,
              child: Text(
                '\$$itemPrice',
                style: context.general.textTheme.labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
