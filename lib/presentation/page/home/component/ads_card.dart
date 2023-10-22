import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';

const contents = [
  'Solusi, Kesehatan Anda',
  'Solusi, Kesehatan Anda',
  'Solusi, Kesehatan Anda'
];

class AdsCard extends StatefulWidget {
  const AdsCard({Key? key}) : super(key: key);

  @override
  State<AdsCard> createState() => _AdsCardState();
}

class _AdsCardState extends State<AdsCard> {
  final _controller = CarouselController();
  final _currentIndex = ValueNotifier<int>(0);

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
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(kMaskingAds, fit: BoxFit.cover))),
          Positioned(
            right: -10,
            top: -40,
            child: Image.asset(
              kCalendar,
              width: 150,
            ),
          ),
          Positioned(
              right: 16,
              bottom: 16,
              child: ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: contents.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: value == entry.key ? 30 : 8,
                            height: 8,
                            margin: const EdgeInsets.all(4),
                            decoration: const ShapeDecoration(
                                shape: StadiumBorder(), color: Colors.white),
                          ),
                        );
                      }).toList(),
                    );
                  })),
          CarouselSlider(
              items: contents
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Solusi, Kesehatan Anda',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              width: size.width - 180,
                              child: Text(
                                  'Update informasi seputar kesehatan semua bisa disini !',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 13))),
                                    onPressed: () {},
                                    child: const Text('Selengkapnya')),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: size.height / 5.5,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
              ))
        ],
      ),
    );
  }
}
