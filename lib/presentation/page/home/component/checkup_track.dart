import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';

class CheckupTrack extends StatelessWidget {
  const CheckupTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.shade300,
                offset: const Offset(0, 10))
          ]),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            left: 16,
            top: -20,
            child: Image.asset(
              kTrack,
              width: 89,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: size.width / 1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Track Pemeriksaan',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: size.width - 180,
                  child: Text(
                      'Kamu dapat mengecek progress pemeriksaanmu disini',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Track',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.blueGrey.shade700,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 8.0),
                    Icon(Icons.arrow_forward_rounded,
                        color: Colors.blueGrey.shade700)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
