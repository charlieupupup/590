import 'package:auto_size_text/auto_size_text.dart';
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
        elevation: 5.0,
        color: colorAlmond,
        // borderRadius: BorderRadius.circular(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AutoSizeText(
                "Curl up with a book!",
                style: TextStyle(
                    fontSize: 32,
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
            ImageIcon(
              AssetImage("images/books_filled.png"),
              color: colorBlackCoral,
              size: height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: colorBlackCoral, fontStyle: FontStyle.italic),
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
        elevation: 5.0,
        color: CustomColor('#F9C0B4'),
        // borderRadius: BorderRadius.circular(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AutoSizeText(
                "Have time for a show?",
                style: TextStyle(
                    fontSize: 32,
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
            ImageIcon(
              AssetImage("images/tv.png"),
              color: colorBlackCoral,
              size: height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: colorBlackCoral, fontStyle: FontStyle.italic),
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
        elevation: 5.0,
        color: colorSoftMelon,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AutoSizeText(
                "How about a nap?",
                style: TextStyle(
                    fontSize: 32,
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
            ImageIcon(
              AssetImage("images/sleep_filled.png"),
              color: colorBlackCoral,
              size: height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: colorBlackCoral, fontStyle: FontStyle.italic),
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
        elevation: 5.0,
        color: CustomColor('#F4D2C4'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AutoSizeText(
                "Go for a run!",
                style: TextStyle(
                    fontSize: 32,
                    color: colorBlackCoral,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
            ImageIcon(
              AssetImage("images/exercise.png"),
              color: colorBlackCoral,
              size: height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'suggestion based on history',
                  textScaleFactor: 1,
                  style: TextStyle(
                      color: colorBlackCoral, fontStyle: FontStyle.italic),
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
