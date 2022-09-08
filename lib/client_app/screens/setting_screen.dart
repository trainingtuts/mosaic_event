import 'package:flutter/material.dart';
import 'package:mosaic_event/client_app/screens/settings/carousel_banner_list.dart';
import 'package:mosaic_event/client_app/screens/settings/category/category_list.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Admin'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.view_carousel),
                title: const Text('Carousel'),
                value: const Text('Add | Remove | View Carousel'),
                onPressed: (context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CarouselBannerList()));
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.category),
                title: const Text('Category'),
                value: const Text('Add | Remove | View Category'),
                onPressed: (context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryListScreen()));
                },
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
