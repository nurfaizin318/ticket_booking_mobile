import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  width: width,
                  height: 300,
                  color: Colors.green,
                ),
                Container(
                  width: width,
                  height: 900,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
