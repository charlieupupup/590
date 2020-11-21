import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
          ),
        ),
      ]);

  List<Widget> getImgs() {
    List a = [
      "images/relax.png",
      "images/checkout.png",
      "images/sleepingbed.png",
    ];
    List<Widget> img = new List();
    img.add(Image.asset(a[0]));
    img.add(Image.asset(a[1]));
    img.add(Image.asset(a[2]));
    return img;
  }
}
