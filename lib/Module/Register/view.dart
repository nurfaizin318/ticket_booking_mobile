import 'package:tiketku/Module/Register/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:tiketku/Theme/appColors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<RegisterController>();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    String? _selectedRole;

  void _registerPressed() {


  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 80),
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
                        const SizedBox(height: 20),
                        Text(
                          "Create a new Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 36,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Fill the form to register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
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
                margin: EdgeInsets.only(
                  top: 250,
                  left: 24,
                  right: 24,
                ),
                height: 500,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Nama Lengkap",
                            isDense: true,
                            counterText: "",
                            prefixIcon: const Icon(Icons.person, color: AppColors.textSecondary,),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFEDF1F3), width: 2.0),
                            ),
                          ),
                          textAlign: TextAlign.start,
                          maxLength: 50,
                          validator: (value) => value!.isEmpty
                              ? 'Nama tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            isDense: true,
                            counterText: "",
                            prefixIcon: const Icon(Icons.email, color: AppColors.textSecondary,),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFEDF1F3), width: 2.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Email tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            controller: _passwordController,
                            obscureText:
                                controller.obsecureTestStatus.value,
                            decoration: InputDecoration(
                              hintText: "Password",
                              isDense: true,
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.lock, color: AppColors.textSecondary,),
                              suffixIcon: IconButton(
                                icon: controller.obsecureTestStatus.value
                                    ? const Icon(
                                        Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  controller.obsecureTestStatus.value =
                                      !controller.obsecureTestStatus.value;
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3), width: 2.0),
                              ),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Password tidak boleh kosong'
                                : null,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "No. HP",
                            isDense: true,
                            counterText: "",
                            prefixIcon: const Icon(Icons.phone, color: AppColors.textSecondary,),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFEDF1F3), width: 2.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Nomor HP tidak boleh kosong'
                              : null,
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _selectedRole,
                          items: ['ADMIN', 'USER'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hintText: "Pilih Role",
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFEDF1F3), width: 2.0),
                            ),
                          ),
                          onChanged: (newValue) {
                            _selectedRole = newValue!;
                          },
                          validator: (value) =>
                              value == null ? 'Role harus dipilih' : null,
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // registerPressed();
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.primary,
                            ),
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text("Sudah punya akun?"),
                        TextButton(
                          onPressed: () {
                            controller
                                .moveToLogin(); 
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
