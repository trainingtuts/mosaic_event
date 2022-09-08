// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mosaic_event/client_app/utils/upload_image.dart';

class CarouselBannerList extends StatefulWidget {
  const CarouselBannerList({Key? key}) : super(key: key);

  @override
  State<CarouselBannerList> createState() => _CarouselBannerListState();
}

class _CarouselBannerListState extends State<CarouselBannerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Carousel"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('carousel_banners')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading..."),
                ],
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(data['carousel_banners_url']),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          deleteCarouselBanner(data['id']);
                        },
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            UploadImage.uploadCarouselBanner(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  deleteCarouselBanner(documentId) {
    final carouselBannerToDelete = FirebaseFirestore.instance
        .collection('carousel_banners')
        .doc(documentId);
    carouselBannerToDelete.delete();
  }
}
