import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app/core/constant/assets_constants.dart';
import 'package:health_app/core/injector.dart';
import 'package:health_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:health_app/presentation/page/main_navigation.dart';
import 'package:health_app/presentation/page/registration/registration_screen.dart';
import 'package:health_app/presentation/widgets/custom_textfield.dart';
import 'package:health_app/presentation/widgets/loading_dialog.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = ValueNotifier<bool>(true);

  void login(BuildContext context) {
    if (emailController.text.isEmpty) {
      const snackBar = SnackBar(content: Text('Email harus diisi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (passwordController.text.isEmpty) {
      const snackBar = SnackBar(content: Text('Password harus diisi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    context.read<AuthenticationBloc>().add(LoginEvent(
        email: emailController.text, password: passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (p, c) => p.loginStatus != c.loginStatus,
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.loginSucceed) {
            const snackBar = SnackBar(content: Text('Login berhasil'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigation(),
                ));
            return;
          }
          if (state.loginStatus == LoginStatus.loginFaild) {
            final snackBar = SnackBar(
                content: Text('Login Gagal : ${state.loginErrorMessage}'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }
        },
        child: Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
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
                        child: Text('Silahkan login untuk melanjutkan',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blueGrey.shade600)),
                      ),
                      Image.asset(kBackdrop1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                            controller: emailController,
                            label: Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            hintText: 'Masukkan email anda'),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ValueListenableBuilder<bool>(
                            valueListenable: isPasswordVisible,
                            builder: (context, value, child) {
                              return CustomTextField(
                                controller: passwordController,
                                onChanged: (value) {},
                                obscureText: value,
                                label: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Password',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text('Lupa Password Anda?',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Colors.blueGrey.shade500))
                                  ],
                                ),
                                hintText: 'Masukkan password anda',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      isPasswordVisible.value = !value;
                                    },
                                    icon: Icon(value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                              );
                            }),
                      ),
                      const SizedBox(height: 40.0),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ElevatedButton(
                                onPressed: () => login(context),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 20),
                                    Text('Login'),
                                    Icon(Icons.arrow_forward_rounded),
                                  ],
                                )),
                          );
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade600),
                          ),
                          const SizedBox(width: 10.0),
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen(),
                                )),
                            child: Text(
                              'Daftar Sekarang',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state.loginStatus == LoginStatus.logingIn) {
                  return const LoadingDialogWidget(message: 'Loading');
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
