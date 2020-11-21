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
            aspectRatio: 2,
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
    img.add(buildImg());
    img.add(Image.asset(a[1]));
    img.add(Image.asset(a[2]));
    return img;
  }

  Widget buildImg() {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colorAeroBlue,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Image.asset("images/relax.png"),
    );
  }
}
