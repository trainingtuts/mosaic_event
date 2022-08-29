// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mosaic_event/utils/my_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCard(),
    );
  }
}
