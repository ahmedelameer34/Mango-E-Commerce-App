import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderScreen extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/640/480?r=123',
    'https://picsum.photos/640/480?r=456',
    'https://picsum.photos/640/480?r=789',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider'),
      ),
      body: Builder(builder: (context) {
        return CarouselSlider(
          items: images.map((image) {
            return Image.network(
              image,
              fit: BoxFit.cover,
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            //  infiniteScrollInterval: Duration(seconds: 2),
            //  infiniteScrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        );
      }),
    );
  }
}
