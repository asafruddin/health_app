// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:health_app/presentation/page/home/component/drawer_widget.dart';
import 'package:health_app/presentation/page/home/home_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final selectedScreen = ValueNotifier<Widget>(const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Builder(builder: (context) {
        return DrawerWidget(
          onPressScreen: (screen) {
            selectedScreen.value = screen;
            Scaffold.of(context).closeEndDrawer();
          },
        );
      }),
      body: ValueListenableBuilder<Widget>(
        valueListenable: selectedScreen,
        builder: (context, value, child) {
          return value;
        },
      ),
    );
  }
}
