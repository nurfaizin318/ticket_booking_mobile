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
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  color: Colors.red,
                  Icons.motorcycle_rounded,
                  size: 70,
                )),
            const SizedBox(height: 60),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "BillJek",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Siap mengantar anda kemanapun",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Username",
                    isDense: true,
                    counterText: "",
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.person)),
                    // contentPadding: const EdgeInsets.all(5.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "password",
                    isDense: true,
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.lock)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _loginPressed,
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueAccent, // Warna latar belakang tombol
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Warna teks tombol
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
