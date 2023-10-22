import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/theme.dart';

class BottomBanner extends StatelessWidget {
  const BottomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      decoration: const BoxDecoration(color: MyTheme.primaryColor),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                kMaskingBottom,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Ingin mendapat update dari kami ?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Dapatkan Notifikasi',
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_rounded, color: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
