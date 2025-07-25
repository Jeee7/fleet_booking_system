import 'package:fleet_booking_system/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fleet_booking_system/constants/color_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool isLoading = false;

  void handleLogin() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final username = usernameController.text.trim();
    final password = passwordController.text;

    setState(() {
      isLoading = false;
    });

    if (username == 'testuser' && password == '12345') {
      snackBarTrigger(context, 'Berhasil Login!');
      Navigator.of(context).pushReplacementNamed('/main');
    } else {
      snackBarTrigger(context, 'Username atau password salah!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              // Username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: ColorList.primaryAccent1,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: ColorList.primaryAccent1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isLoading ? null : handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorList.primary,
                  minimumSize: const Size(double.infinity, 48),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    isLoading
                        ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorList.white,
                            ),
                            strokeWidth: 2,
                          ),
                        )
                        : const Text(
                          'Login',
                          style: TextStyle(
                            color: ColorList.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
              // const SizedBox(height: 16),
              // ElevatedButton.icon(
              //   icon: Image.network(
              //     'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
              //     width: 24,
              //     height: 24,
              //   ),
              //   label: const Text(
              //     'Login with Google',
              //     style: TextStyle(
              //       color: ColorList.white,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   onPressed:
              //       isLoading
              //           ? null
              //           : () {
              //             snackBarTrigger(context, 'Login Google berhasil!');
              //             Navigator.of(context).pushReplacementNamed('/main');
              //           },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: ColorList.primary,
              //     foregroundColor: ColorList.textPrimary,
              //     minimumSize: const Size(double.infinity, 48),
              //     textStyle: const TextStyle(fontSize: 18),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
