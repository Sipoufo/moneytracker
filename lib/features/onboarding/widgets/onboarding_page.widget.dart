import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/device/device.util.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  final String image, title, body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeUtil.defaultSpace),
      child: Column(
        children: [
          Image(
            width: DeviceUtils.getScreenWidth(context),
            height: DeviceUtils.getScreenHeight(context) * 0.5,
            fit: BoxFit.contain,
            image: AssetImage(image),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: SizeUtil.spaceBtwItems_2,
          ),
          Text(
            body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
