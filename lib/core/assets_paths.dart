import 'package:flutter/material.dart';

class Assets {
  static const String banner1 = 'assets/images/Banner 1.png';
  static const String coffeeShopMobileAppDesignImages =
      'assets/images/Coffee Shop Mobile App Design Images.zip';
  static const String coffee1 = 'assets/images/coffee1.png';
  static const String coffee2 = 'assets/images/coffee2.png';
  static const String coffee3 = 'assets/images/coffee3.png';
  static const String coffee4 = 'assets/images/coffee4.png';
  static const String coffee5 = 'assets/images/coffee5.png';
  static const String coffee6 = 'assets/images/coffee6.png';
  static const String bean = 'assets/icons/bean.svg';
  static const String bike = 'assets/icons/bike.svg';
  static const String gps = 'assets/icons/gps.svg';
  static const String milk = 'assets/icons/milk.svg';
  static const String minuscircle = 'assets/icons/minuscircle.svg';
  static const String plus = 'assets/icons/plus.svg';
  static const String pluscircle = 'assets/icons/pluscircle.svg';
  static const String arrowLeft2 = 'assets/svgs/Left2.svg';
  static const String arrowRight2 = 'assets/svgs/Right2.svg';
  static const String arrowUp2 = 'assets/svgs/Arrow2.svg';
  static const String bag = 'assets/svgs/Bag.svg';
  static const String calling = 'assets/svgs/Calling.svg';
  static const String discount = 'assets/svgs/Discount.svg';
  static const String filter = 'assets/svgs/Filter.svg';
  static const String heart = 'assets/svgs/Heart.svg';
  static const String home = 'assets/svgs/Home.svg';
  static const String moreCircle = 'assets/svgs/More Circle.svg';
  static const String notification = 'assets/svgs/Notification.svg';
  static const String search = 'assets/svgs/Search.svg';
  static const String star = 'assets/svgs/Star.svg';
}

Future<void> myPrecacheImage(BuildContext context) async {
  await Future.wait([
    precacheImage(const AssetImage(Assets.bean), context),
    precacheImage(const AssetImage(Assets.bike), context),
    precacheImage(const AssetImage(Assets.gps), context),
    precacheImage(const AssetImage(Assets.milk), context),
    precacheImage(const AssetImage(Assets.minuscircle), context),
    precacheImage(const AssetImage(Assets.plus), context),
    precacheImage(const AssetImage(Assets.pluscircle), context),
  ]);
}
