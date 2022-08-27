// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  final List source;
  const MyCarousel({Key? key, required this.source}) : super(key: key);

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        viewportFraction: 1,
        autoPlay: true,
        aspectRatio: 16 / 9,
      ),
      items: widget.source.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imagePath['carousel_banners_url']),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
