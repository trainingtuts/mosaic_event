// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mosaic_event/screens/settings/carousel_banner_list.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Admin'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.view_carousel),
                title: Text('Carousel'),
                value: Text('Add | Remove | View Carousel'),
                onPressed: (context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarouselBannerList()));
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.category),
                title: Text('Category'),
                value: Text('Add | Remove | View Category'),
                onPressed: (context) {},
              ),
              // SettingsTile.switchTile(
              //   onToggle: (value) {},
              //   initialValue: true,
              //   leading: Icon(Icons.format_paint),
              //   title: Text('Enable custom theme'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
