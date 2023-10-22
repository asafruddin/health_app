import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key}) : super(key: key);

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
        children: [
          Positioned(
            right: 16,
            top: -40,
            child: Image.asset(
              kService,
              width: 110,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Layanan Khusus',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: size.width - 180,
                  child: Text('Tes Covid 19, Cegah Corona Sedini Mungkin',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text('Daftar Test',
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
