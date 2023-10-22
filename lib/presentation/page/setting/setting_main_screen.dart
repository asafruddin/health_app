import 'package:flutter/material.dart';
import 'package:health_app/presentation/page/profile/profile_page.dart';
import 'package:health_app/presentation/page/setting/setting_page.dart';
import 'package:health_app/presentation/theme.dart';
import 'package:health_app/presentation/widgets/bottom_banner.dart';
import 'package:health_app/presentation/widgets/shadow.dart';

/// Menu
const kMenuProfile = 'PROFILE';
const kMenuSetting = 'SETTING';

class SettingMainScreen extends StatefulWidget {
  const SettingMainScreen({Key? key, required this.selectedMenu})
      : super(key: key);

  final String selectedMenu;

  @override
  State<SettingMainScreen> createState() => _SettingMainScreenState();
}

class _SettingMainScreenState extends State<SettingMainScreen> {
  final selectedPage = ValueNotifier(kMenuProfile);

  @override
  void initState() {
    super.initState();
    selectedPage.value = widget.selectedMenu;
  }

  @override
  void didUpdateWidget(covariant SettingMainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedPage.value = widget.selectedMenu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: const StadiumBorder(),
                  shadows: [cardShadow]),
              child: ValueListenableBuilder<String>(
                  valueListenable: selectedPage,
                  builder: (context, value, child) {
                    final isProfileSelected = value == kMenuProfile;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            selectedPage.value = kMenuProfile;
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: ShapeDecoration(
                                  shape: const StadiumBorder(),
                                  color: isProfileSelected
                                      ? MyTheme.secondaryColor
                                      : Colors.white),
                              child: Text('Profile',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: isProfileSelected
                                              ? FontWeight.w600
                                              : null))),
                        ),
                        const SizedBox(width: 12.0),
                        InkWell(
                          onTap: () {
                            selectedPage.value = kMenuSetting;
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: ShapeDecoration(
                                shape: const StadiumBorder(),
                                color: !isProfileSelected
                                    ? MyTheme.secondaryColor
                                    : Colors.white),
                            child: Text('Pengaturan',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: !isProfileSelected
                                            ? FontWeight.w600
                                            : null)),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 40.0),
            ValueListenableBuilder(
              valueListenable: selectedPage,
              builder: (context, value, child) {
                if (value == kMenuProfile) {
                  return const ProfilePage();
                }
                return const SettingPage();
              },
            )
          ],
        ),
      ),
    );
  }
}
