import 'package:flutter/material.dart';
import 'package:health_app/presentation/page/home/component/ads_card.dart';
import 'package:health_app/presentation/page/home/component/checkup_track.dart';
import 'package:health_app/presentation/page/home/component/product_list.dart';
import 'package:health_app/presentation/page/home/component/search_and_filter.dart';
import 'package:health_app/presentation/page/home/component/service_card.dart';
import 'package:health_app/presentation/page/home/component/service_type.dart';
import 'package:health_app/presentation/widgets/bottom_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu_rounded)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_rounded))
        ],
      ),
      bottomNavigationBar: const BottomBanner(),
      body: ListView(
        children: const [
          SizedBox(height: 50),
          AdsCard(),
          SizedBox(height: 50),
          ServiceCard(),
          SizedBox(height: 50),
          CheckupTrack(),
          SizedBox(height: 50),
          SearchAndFilter(),
          SizedBox(height: 30),
          ProductList(),
          SizedBox(height: 20),
          ServiceType(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
