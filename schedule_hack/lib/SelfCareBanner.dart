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

    img.add( Material(
      elevation: 5,
      child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
          color: colorAlmond,
          // borderRadius: BorderRadius.circular(22.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Let\s Read!',
                textScaleFactor: 2,
                style: TextStyle(
                  color: colorBlackCoral,
                ),
              ),
            ),
            ImageIcon(
              AssetImage("images/books_filled.png"),
              color: colorBlackCoral,
              size: 75.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: colorBlackCoral,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));

    img.add(Material(
      elevation: 5,
      child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
          color: colorSoftMelon,
          // borderRadius: BorderRadius.circular(22.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'How about a nap?',
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
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: colorBlackCoral,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));

    img.add(Material(
      elevation: 5,
      child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
          color: colorDarkSkyBlue,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Let\'s run!',
                textScaleFactor: 2,
                style: TextStyle(
                  color: colorBlackCoral,
                ),
              ),
            ),
            ImageIcon(
              AssetImage("images/running.png"),
              color: colorBlackCoral,
              size: 75.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: colorBlackCoral,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));

    return img;
  }
}
