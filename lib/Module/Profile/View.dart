import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BubleBlue(),
              BubleYellow(),
              BubleRed(),
              Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                    color: Colors.white),
                margin: EdgeInsets.only(top: 160),
                height: height,
                width: width,
                child: Column(children: [
                  Container(
                    width: width,
                    height: 160,
                    // color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Row(children: [
                        const SizedBox(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://picsum.photos/500/300"),
                            maxRadius: 15,
                            minRadius: 15,
                          ),
                        ),
                        Container(
                          height: 100,
                          // color: Colors.red,
                          padding: EdgeInsets.all(20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                "Michle BillJek",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                textAlign: TextAlign.left,
                                "Michle BillJek",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(20),

                    // color: Colors.grey,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text("michele@gmail.com",
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "+6239039039039",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        const Text("Saldo BillJek"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Rp. 180.000",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      InkWell(
                        splashColor: Colors.white30,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_outline_outlined,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Pusat Bantuan",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.white30,
                        onTap: () {
                          Get.toNamed("/login");
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Log Out",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned BubleRed() {
    return Positioned(
      right: -80,
      top: -80,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(150)),
            color: Colors.red),
      ),
    );
  }

  Positioned BubleYellow() {
    return Positioned(
      left: 50,
      top: -200,
      child: Container(
        width: 400,
        height: 400,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(200)),
            color: Colors.yellow),
      ),
    );
  }

  Positioned BubleBlue() {
    return Positioned(
      left: -70,
      top: -100,
      child: Container(
        width: 500,
        height: 500,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(250)),
            color: Colors.blue),
      ),
    );
  }
}
