import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/page/auth/auth_screen.dart';
import 'package:health_app/presentation/page/home/home_screen.dart';
import 'package:health_app/presentation/page/setting/setting_main_screen.dart';
import 'package:health_app/presentation/theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.onPressScreen}) : super(key: key);

  final Function(Widget screen) onPressScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300')),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Angga',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.primaryColor),
                            children: [
                          TextSpan(
                              text: ' Praja',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: MyTheme.primaryColor))
                        ])),
                    const SizedBox(height: 5),
                    Text(
                      'Membership BBLK',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: MyTheme.primaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () => onPressScreen(const HomeScreen()),
            title: Text(
              'Dashboard',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade600,
            ),
          ),
          ListTile(
            onTap: () => onPressScreen(
                const SettingMainScreen(selectedMenu: kMenuProfile)),
            title: Text(
              'Profile Saya',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade600,
            ),
          ),
          ListTile(
            onTap: () => onPressScreen(
                const SettingMainScreen(selectedMenu: kMenuSetting)),
            title: Text(
              'Pengaturan',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ),
                (route) => false),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.red),
              child: Text('Logout',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w200, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ikuti kami di ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyTheme.primaryColor)),
              SvgPicture.asset(kFacebookIcon),
              SvgPicture.asset(kInstagramIcon),
              SvgPicture.asset(kTwitterIcon),
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('FAQ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey.shade400)),
                Text(
                  'Term and Condition',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey.shade400),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
