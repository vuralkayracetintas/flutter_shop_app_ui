import 'package:flutter/material.dart';
import 'package:flutter_shop_app/product/constans/image_constants.dart';
import 'package:flutter_shop_app/product/constans/string_constans.dart';
import 'package:kartal/kartal.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    StringConstants stringConstants = const StringConstants();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.padding.onlyTopHigh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(image: AssetImage(ImageConstans.im_basket)),
              Text(
                stringConstants.introTitle,
                textAlign: TextAlign.center,
                style: context.general.textTheme.displayMedium,
              ),
              Text(
                stringConstants.introSubtitle,
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(context.sized.width * 0.6, 50),
                ),
                child: Text(stringConstants.introButton,
                    style: const TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
