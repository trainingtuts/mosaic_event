import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.40,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/restaurants/r1.jpg"),
                      fit: BoxFit.cover),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      "Discription",
                      style: TextStyle(),
                      textScaleFactor: 0.9,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        const Text(
                          "150",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1.25,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
