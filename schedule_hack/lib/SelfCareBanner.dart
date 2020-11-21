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
            enlargeCenterPage: true,
            viewportFraction: 0.4,
            aspectRatio: 2,
          ),
        ),
      ]);

  List<Widget> getImgs() {
    List<Widget> img = new List();

    img.add(Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colorAeroBlue,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('tired? recommendation based on recent activity'),
          Image.asset("images/relax.png"),
        ],
      ),
    ));

    img.add(Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colorSoftMelon,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Image.asset("images/sleepingbed.png"),
    ));

    img.add(Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colorPowderBlue,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Image.asset("images/checkout.png"),
    ));

    return img;
  }
}
