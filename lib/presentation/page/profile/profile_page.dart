import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/theme.dart';
import 'package:health_app/presentation/widgets/custom_textfield.dart';
import 'package:health_app/presentation/widgets/shadow.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            height: 114,
            decoration: const BoxDecoration(
                color: MyTheme.primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      kMaskingProfile,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/300')),
                      const SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                          color: Colors.white),
                                  children: [
                                TextSpan(
                                    text: ' Praja',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white))
                              ])),
                          const SizedBox(height: 5),
                          Text(
                            'Membership BBLK',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.grey.shade200),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [cardShadow],
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      color: MyTheme.primaryColor.withOpacity(0.9)),
                  child: Text(
                    'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih data yang ingin ditampilkan',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.primaryColor),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: MyTheme.secondaryColor,
                            child: Icon(Icons.person_pin_rounded,
                                color: MyTheme.primaryColor),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Data diri',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text('Data diri anda sesuai KTP',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.grey.shade400)),
                            ],
                          )),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.person_pin_rounded,
                                color: Colors.grey.shade900),
                          )
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      FormProfile(
                        hintText: 'Nama Depan',
                        label: 'Nama Depan',
                        onChange: (text) {},
                        padding: const EdgeInsets.only(left: 20.0, right: 5),
                      ),
                      const SizedBox(height: 16.0),
                      FormProfile(
                        hintText: 'Nama Belakang',
                        label: 'Nama Belakang',
                        onChange: (text) {},
                        padding: const EdgeInsets.only(left: 20.0, right: 5),
                      ),
                      const SizedBox(height: 16.0),
                      FormProfile(
                        hintText: 'Masukkan No. Ktp Anda',
                        label: 'No. Ktp',
                        onChange: (text) {},
                      ),
                      const SizedBox(height: 16.0),
                      FormProfile(
                        hintText: 'Masukkan Email Anda',
                        label: 'Email',
                        onChange: (text) {},
                      ),
                      const SizedBox(height: 16.0),
                      FormProfile(
                        hintText: 'Masukkan No. Telepon Anda',
                        label: 'No. Telepon',
                        onChange: (text) {},
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          const Icon(Icons.info, color: MyTheme.primaryColor),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Text(
                              'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 20),
                            Text('Simpan Profile'),
                            Icon(Icons.save_outlined),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FormProfile extends StatelessWidget {
  const FormProfile(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.onChange,
      this.fieldKey,
      this.padding,
      this.suffixIcon})
      : super(key: key);

  final String label;
  final String hintText;
  final Function(String text) onChange;
  final String? fieldKey;
  final EdgeInsets? padding;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextField(
        label: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
