import 'package:tiketku/Module/Login/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiketku/Theme/appColors.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final controller = Get.find<LoginController>();
    final theme = Theme.of(context);

    void loginPressed() {
      // Anda dapat menambahkan logika untuk validasi login dan aksi selanjutnya di sini
      String username = _usernameController.text;
      String password = _passwordController.text;

      controller.moveToHomePage();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                  height: height * 0.50,
                  width: width,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    image: DecorationImage(
                        image: AssetImage("assets/images/Star.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/logo_product_2.png",
                        fit: BoxFit.cover,
                        height: 10,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Sign in to your Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.background,
                              fontSize: 40,
                              height: 1.2,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Enter your email and password to log in ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.background,
                              fontSize: 16,
                              height: 1)),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: height * 0.50,
                    width: width,
                    color: AppColors.lightGrey,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 270, left: 24, right: 24),
              height: 400,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "wrong email or password";
                        }
                        return null;
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
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: const Color(0xFFEDF1F3),
                                  width: 2.0))),
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
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: const Color(0xFFEDF1F3),
                                    width: 2.0))),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        maxLength: 20,
                        controller: _passwordController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            controller.moveToRegister();
                          },
                          child: const Text('Lupa Password'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          loginPressed();
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors
                              .primary, // Warna latar belakang tombol
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
    );
  }
}
