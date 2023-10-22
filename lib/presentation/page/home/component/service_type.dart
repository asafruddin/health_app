import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/theme.dart';
import 'package:health_app/presentation/widgets/shadow.dart';

const kSatuan = 'SATUAN';
const kPaketPemeriksaan = 'PAKET PEMERIKSAAN';

class ServiceType extends StatefulWidget {
  const ServiceType({Key? key}) : super(key: key);

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  final selectedType = ValueNotifier(kSatuan);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Tipe Layanan Kesehatan Anda',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 20.0),
          ValueListenableBuilder<String>(
              valueListenable: selectedType,
              builder: (context, value, child) {
                return TabTypeService(
                  isSatuanSelected: value == kSatuan,
                  selectType: (type) {
                    selectedType.value = type;
                  },
                );
              }),
          const SizedBox(height: 20.0),
          ...List.generate(5, (index) {
            if (index % 2 != 0) {
              return const SizedBox(height: 10.0);
            }
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [cardShadow]),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10.0),
                        Text(
                          'Rp. 10.000',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber.shade900),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            const Icon(Icons.apartment_rounded,
                                color: MyTheme.primaryColor),
                            const SizedBox(width: 5.0),
                            Text('Lenmarc Surabaya',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: MyTheme.primaryColor),
                            const SizedBox(width: 5.0),
                            Text(
                              'Dukuh Pakis, Surabaya',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      kDummyImage,
                      width: 120,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class TabTypeService extends StatelessWidget {
  const TabTypeService(
      {Key? key, required this.isSatuanSelected, required this.selectType})
      : super(key: key);

  final bool isSatuanSelected;
  final Function(String type) selectType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: const StadiumBorder(),
          shadows: [cardShadow]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => selectType(kSatuan),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: isSatuanSelected
                        ? MyTheme.secondaryColor
                        : Colors.white),
                child: Text('Satuan',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight:
                            isSatuanSelected ? FontWeight.w600 : null))),
          ),
          const SizedBox(width: 12.0),
          InkWell(
            onTap: () => selectType(kPaketPemeriksaan),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: !isSatuanSelected
                      ? MyTheme.secondaryColor
                      : Colors.white),
              child: Text('Paket Pemeriksaan',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: !isSatuanSelected ? FontWeight.w600 : null)),
            ),
          )
        ],
      ),
    );
  }
}
