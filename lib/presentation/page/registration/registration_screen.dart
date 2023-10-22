import 'package:flutter/material.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/presentation/page/auth/auth_screen.dart';
import 'package:health_app/presentation/widgets/custom_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Hi, Selamat Datang',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Silahkan isi data form dibawah ini',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.blueGrey.shade600)),
              ),
              Image.asset(kBackdrop1),
              Row(
                children: [
                  Expanded(
                    child: FormRegistration(
                      hintText: 'Nama Depan',
                      label: 'Nama Depan',
                      onChange: (text) {},
                      padding: const EdgeInsets.only(left: 20.0, right: 5),
                    ),
                  ),
                  Expanded(
                    child: FormRegistration(
                      hintText: 'Nama Belakang',
                      label: 'Nama Belakang',
                      onChange: (text) {},
                      padding: const EdgeInsets.only(right: 20.0, left: 5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              FormRegistration(
                hintText: 'Masukkan No. Ktp Anda',
                label: 'No. Ktp',
                onChange: (text) {},
              ),
              const SizedBox(height: 16.0),
              FormRegistration(
                hintText: 'Masukkan Email Anda',
                label: 'Email',
                onChange: (text) {},
              ),
              const SizedBox(height: 16.0),
              FormRegistration(
                hintText: 'Masukkan No. Telepon Anda',
                label: 'No. Telepon',
                onChange: (text) {},
              ),
              const SizedBox(height: 16.0),
              FormRegistration(
                hintText: 'Masukkan Password Anda',
                label: 'Password',
                onChange: (text) {},
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined)),
              ),
              const SizedBox(height: 16.0),
              FormRegistration(
                hintText: 'Masukkan Password Anda',
                label: 'Konfirmasi Password',
                onChange: (text) {},
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined)),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20),
                        Text('Register'),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    )),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.grey.shade600),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    ),
                    child: Text(
                      'Login Sekarang',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey.shade800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}

class FormRegistration extends StatelessWidget {
  const FormRegistration(
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
