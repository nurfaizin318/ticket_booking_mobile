import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerPressed() {
    // Anda dapat menambahkan logika untuk mengirim data registrasi ke server atau melakukan aksi selanjutnya di sini
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    print('Username: $username');
    print('Email: $email');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Username",
                    isDense: true,
                    counterText: "",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    isDense: true,
                    counterText: "",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Ulangi Password",
                    isDense: true,
                    counterText: "",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "No hp",
                    isDense: true,
                    counterText: "",
                    prefixIcon: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '+62 :',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none)),
                textAlign: TextAlign.start,
                maxLines: 1,
                maxLength: 20,
                // controller: _locationNameTextController,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registerPressed,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
