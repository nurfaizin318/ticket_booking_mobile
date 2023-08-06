import 'package:billjek/Module/Login/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    void _loginPressed() {
      // Anda dapat menambahkan logika untuk validasi login dan aksi selanjutnya di sini
      String username = _usernameController.text;
      String password = _passwordController.text;


      controller.moveToHomePage();
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "BillJek",
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loginPressed,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            const Text("Belum punya akun?"),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
              ),
              onPressed: () {
                controller.moveToRegister();
              },
              child: const Text('daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
