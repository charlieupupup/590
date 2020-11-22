import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:schedule_hack/utilities.dart';

class CarouselBanner extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  BuildContext context;
  double height;
  double width;

  CarouselBanner(BuildContext _context) {
    this.context = _context;
    var padding = MediaQuery.of(context).padding;
    height = MediaQuery.of(context).size.height - padding.top - padding.bottom;
    width = MediaQuery.of(context).size.width - padding.left - padding.right;
  }

  @override
  Widget build(context) {
    return Column(children: <Widget>[
      CarouselSlider(
        items: getImgs(),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: true,
          height: height / 5,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2,
        ),
      ),
    ]);
  }

  List<Widget> getImgs() {
    List<Widget> img = new List();

    img.add(SizedBox(
      width: width,
      height: height / 10,
      child: Card(
        // margin: EdgeInsets.all(6.0),
        elevation: 4.0,
        color: colorAlmond,
        // borderRadius: BorderRadius.circular(22.0),
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

    img.add(SizedBox(
      width: width,
      height: height / 10,
      child: Card(
        // margin: EdgeInsets.all(6.0),
        elevation: 4.0,
        color: colorSoftMelon,
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
    img.add(SizedBox(
      width: width,
      height: height / 10,
      child: Card(
        // margin: EdgeInsets.all(6.0),
        elevation: 4.0,
        color: colorDarkSkyBlue,
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
