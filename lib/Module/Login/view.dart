import 'package:billjek/Module/Login/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final controller = Get.find<LoginController>();

    void _loginPressed() {
      // Anda dapat menambahkan logika untuk validasi login dan aksi selanjutnya di sini
      String username = _usernameController.text;
      String password = _passwordController.text;

      controller.moveToHomePage();
    }

    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Stack(children: [
              Image.asset(
                "assets/images/bus2.png",
                fit: BoxFit.cover,
                height: height * 0.40,
                width: width,
              ),
     
              Container(
                height: height * 0.50,
                margin: EdgeInsets.only(top: height * 0.40),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Masuk ke akun anda",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "wrong email or password";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Username",
                            isDense: true,
                            counterText: "",
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.person)),
                            // contentPadding: const EdgeInsets.all(5.0),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none)),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        maxLength: 20,
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.obsecureTestStatus.value,
                          decoration: InputDecoration(
                              hintText: "password",
                              isDense: true,
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.lock)),
                              suffixIcon: IconButton(
                                icon: controller.obsecureTestStatus.value
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  controller.obsecureTestStatus.value =
                                      !controller.obsecureTestStatus.value;
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide.none)),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          maxLength: 20,
                          controller: _passwordController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _loginPressed();
                          }
                        },
                        child: Container(
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(
                                0xFF0D47A1), // Warna latar belakang tombol
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
