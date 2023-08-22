import 'package:billjek/Module/History/viewModel.dart';
import 'package:billjek/Module/Register/viewModel.dart';
import 'package:billjek/Utils/Color/color.dart';
import 'package:billjek/Utils/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';

import 'package:get/get_core/src/get_main.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: Text("Aktivitas")),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 50,
              //   width: width,
              //   // color: Colors.purpleAccent,
              //   child: Text(
              //     "Aktivitas",
              //     style:
              //         DynamicTextStyle.textBold(fontSize: 30, color: grey700),
              //   ),
              // ),
              // ListView.builder(
              //     // shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: controller.data.length,
              //     itemBuilder: (context, index) {
              //       return Row(
              //           crossAxisAlignment: CrossAxisAlignment.end,
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.all(10),
              //               margin: EdgeInsets.all(5),
              //               height: 100,
              //               width: 100,
              //               decoration: RoundedFixBox.getDecoration(
              //                   color:
              //                       controller.data[index]["color"] as Color),
              //               child: Column(children: [
              //                 Icon(
              //                   Icons.drive_eta_rounded,
              //                   size: 50,
              //                   color: controller.data[index]["iconColor"]
              //                       as Color,
              //                 ),
              //                 const SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   controller.data[index]["title"] as String,
              //                   style: DynamicTextStyle.textBold(
              //                       color: grey600, fontSize: 13),
              //                 )
              //               ]),
              //             )
              //           ]);
              //     }),
              Container(
                width: width,
                child: FutureBuilder(
                  builder: (ctx, snapshot) {
                    // Checking if future is resolved or not
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            '${snapshot.error} occurred',
                            style: TextStyle(fontSize: 18),
                          ),
                        );

                        // if we got our data
                      } else if (snapshot.hasData) {
                        // Extracting data from snapshot object
                        final data = snapshot.data;

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 5),
                                width: 100,
                                height: 100,
                                decoration:
                                    RoundedFixBox.getDecoration(color: blue50),
                                child: Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        // color: Colors.orange,
                                        child: const Center(
                                          child: Icon(
                                            Icons.drive_eta_rounded,
                                            size: 30,
                                            color: blue700,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.data[index]["title"],
                                              style: DynamicTextStyle.textBold(
                                                  color: grey700, fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              controller.data[index]["date"],
                                              style:
                                                  DynamicTextStyle.textNormal(
                                                      color: grey700,
                                                      fontSize: 15),
                                            )
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        // color: Colors.green,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.data[index]["price"],
                                              style:
                                                  DynamicTextStyle.textNormal(
                                                      color: grey500,
                                                      fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ))
                                ]),
                              );
                            });
                      }
                    }
                    // Displaying LoadingSpinner to indicate waiting state
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },

                  // Future that needs to be resolved
                  // inorder to display something on the Canvas
                  future: controller.getData(),
                ),
              ),
            ],
          )),
    );
  }
}
