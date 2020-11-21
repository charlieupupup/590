import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class CarouselBanner extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: getImgs(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2,
          ),
        ),
      ]);

  List<Widget> getImgs() {
    List<Widget> img = new List();

    // img.add(SizedBox(
    //   width: 300,
    //   height: 150,
    //   child: DecoratedBox(
    //     decoration: BoxDecoration(
    //       color: colorAeroBlue,
    //       borderRadius: BorderRadius.circular(22.0),
    //     ),
    //   ),
    // ));

    img.add(Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
        color: colorAeroBlue,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'let\'s medidate',
              textScaleFactor: 2,
              style: TextStyle(
                color: colorBlackCoral,
              ),
            ),
          ),
          ImageIcon(
            AssetImage("images/relax.png"),
            color: colorBlackCoral,
            size: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'suggestion based on history',
                textScaleFactor: 0.7,
                style: TextStyle(
                  color: colorBlackCoral,
                ),
              ),
            ],
          ),
        ],
      ),
    ));

    img.add(Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
        color: colorSoftMelon,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'take a nap',
              textScaleFactor: 2,
              style: TextStyle(
                color: colorBlackCoral,
              ),
            ),
          ),
          ImageIcon(
            AssetImage("images/sleepingbed.png"),
            color: colorBlackCoral,
            size: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'suggestion based on history',
                textScaleFactor: 0.8,
                style: TextStyle(
                  color: colorBlackCoral,
                ),
              ),
            ],
          ),
        ],
      ),
    ));

    img.add(Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(
        color: colorPowderBlue,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'take a nap',
              textScaleFactor: 2,
              style: TextStyle(
                color: colorBlackCoral,
              ),
            ),
          ),
          ImageIcon(
            AssetImage("images/checkout.png"),
            color: colorBlackCoral,
            size: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'suggestion based on history',
                textScaleFactor: 0.8,
                style: TextStyle(
                  color: colorBlackCoral,
                ),
              ),
            ],
          ),
        ],
      ),
    ));

    return img;
  }
}
