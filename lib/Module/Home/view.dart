import 'package:billjek/Module/Home/viewModel.dart';
import 'package:billjek/Utils/Color/color.dart';
import 'package:billjek/Utils/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../Component/topBar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final TopBarCotroller = Get.put(TopBarwithOpacityController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List gradientCard = [
      const LinearGradient(
          colors: [
            red200,
            red1000,
          ],
          begin: FractionalOffset(1.0, 0.0),
          end: FractionalOffset(0.0, 0.9),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      const LinearGradient(
          colors: [
            blue700,
            blue400,
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp)
    ];

    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.depth == 0) {
                TopBarCotroller.onNotificationScroll(notification);
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Container(
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: width,
                              height: 130,
                              color: yellow800,
                              child: Stack(children: [
                                Positioned(
                                    left: -50,
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      decoration: RoundedFixBox.getDecoration(
                                          radius: 100,
                                          color: Colors.white.withOpacity(0.2)),
                                    )),
                                Positioned(
                                    right: -20,
                                    top: -20,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: RoundedFixBox.getDecoration(
                                          radius: 50,
                                          color: Colors.white.withOpacity(0.1)),
                                    ))
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: width,
                              height: 200,
                              color: grey50,
                              child: Center(
                                child: FutureBuilder(
                                  builder: (ctx, snapshot) {
                                    // Checking if future is resolved or not
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
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
                                            // shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.data.length,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.toNamed("/order");
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        height: 100,
                                                        width: 100,
                                                        decoration: RoundedFixGradient
                                                            .getDecoration(
                                                                gradient:
                                                                    gradientCard[
                                                                        index]),
                                                        child:
                                                            Column(children: [
                                                          const Icon(
                                                            Icons
                                                                .drive_eta_rounded,
                                                            size: 50,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            controller.data[
                                                                        index]
                                                                    ["title"]
                                                                as String,
                                                            style: DynamicTextStyle
                                                                .textBold(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13),
                                                          )
                                                        ]),
                                                      ),
                                                    )
                                                  ]);
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
                            ),
                          ],
                        ),
                        Positioned(
                          top: 70,
                          child: SaldoContainer(width),
                        ),
                      ],
                    ),
                    Container(
                      width: width,
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 20,
                      ),
                      child: CurentlyContainer(width),
                    ),
                    Container(
                        // color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Billjek banyak promo nih ",
                          style: DynamicTextStyle.textBold(color: grey700),
                        )),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                      width: width,
                      height: 270,
                      // color: Colors.orange,
                      child: FutureBuilder(
                        builder: (ctx, snapshot) {
                          // Checking if future is resolved or not
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.promo.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(5),
                                            // height: 270,
                                            width: width * 0.9,
                                            decoration:
                                                RoundedFixBox.getDecoration(
                                                    color: Colors.white),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: 150,
                                                    color: Colors.white,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              topRight: Radius
                                                                  .circular(5)),
                                                      child: Image.network(
                                                        controller.promo[index]
                                                            ["image"] as String,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                      controller.promo[index]
                                                          ["title"] as String,
                                                      style: DynamicTextStyle
                                                          .textBold(
                                                              color: grey500),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      controller.promo[index]
                                                              ["subtitle"]
                                                          as String,
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  )
                                                ]),
                                          )
                                        ]);
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
                        future: controller.getPromo(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TopBarWithOppacity()
        ],
      ),
    );
  }

  Container CurentlyContainer(double width) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: blue900,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      width: width * 0.9,
      height: 180,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Akhir - akhir ini : ",
                style: DynamicTextStyle.textNormal(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              Text(
                "View All",
                style: DynamicTextStyle.textNormal(
                    color: Colors.white, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Icon(
                Icons.drive_eta_outlined,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BillCar",
                    style: DynamicTextStyle.textBold(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tanah abang - Palmerah",
                    style: DynamicTextStyle.textNormal(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.drive_eta_outlined,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BillCar",
                    style: DynamicTextStyle.textBold(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tanah abang - Palmerah",
                    style: DynamicTextStyle.textNormal(color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container SaldoContainer(double width) {
    return Container(
      padding: EdgeInsets.all(19),
      width: width * 0.9,
      height: 120,
      decoration: RoundedFixBox.getDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              // color: Colors.red,
              child: Container(
                decoration:
                    RoundedFixBox.getDecoration(radius: 10.0, color: blue50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Saldo :",
                      style: DynamicTextStyle.textBold(
                          fontSize: 18, color: blue900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp. 200.000.000",
                      style: DynamicTextStyle.textBold(
                          fontSize: 14, color: blue900),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              // color: Colors.green
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.toNamed("/profile");
                        },
                        splashColor: grey800,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: RoundedFixBox.getDecoration(
                              radius: 10, color: blue1000),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_circle_up_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Top up",
                        style: DynamicTextStyle.textNormal(
                            color: blue800,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: RoundedFixBox.getDecoration(
                              radius: 10, color: blue1000),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_circle_down_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Tarik",
                        style: DynamicTextStyle.textNormal(
                            color: blue700,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
