// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:mosaic_event/screens/restaurants.dart';
import 'package:mosaic_event/theme/theme.dart';

// import '../themes/my_theme.dart';

class MyCatagories extends StatefulWidget {
  const MyCatagories({Key? key}) : super(key: key);

  @override
  State<MyCatagories> createState() => _MyCatagoriesState();
}

class _MyCatagoriesState extends State<MyCatagories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantList()),
                      );
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        border: Border.all(
                          color: MyColors.secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.restaurant,
                              size: 30,
                            ),
                            Text(
                              "Restaurants",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      print("Luxury Car pressed");
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        border: Border.all(
                          color: MyColors.secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.car_rental,
                              size: 30,
                            ),
                            Text(
                              "Luxury Car",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
