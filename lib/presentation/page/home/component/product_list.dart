import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/theme.dart';
import 'package:health_app/presentation/widgets/shadow.dart';

const productCategory = ['All Product', 'Layanan Kesehatan', 'Alat Kesehatan'];

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                productCategory.length + (productCategory.length - 1), (index) {
              if (index % 2 != 0) {
                return const SizedBox(width: 16.0);
              }
              final e = productCategory[index ~/ 2];
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: index == 0 ? MyTheme.primaryColor : Colors.white,
                    shadows: [cardShadow]),
                child: Text(
                  e,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: index == 0 ? Colors.white : MyTheme.primaryColor),
                ),
              );
            }),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              if (index % 2 != 0) {
                return const SizedBox(width: 15.0);
              }
              return Container(
                  width: width / 2.1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [cardShadow],
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star, color: Colors.yellow.shade400),
                          Text('5',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey.shade400))
                        ],
                      ),
                      Center(child: Image.asset(kProductImage, height: 80)),
                      Text(
                        'Suntikan Steril',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. 10.000',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.amber.shade900),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text('Ready Stok',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.green.shade900)),
                          )
                        ],
                      ),
                    ],
                  ));
            }),
          ),
        )
      ],
    );
  }
}
