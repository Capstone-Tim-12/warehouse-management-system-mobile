import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/chatbot_controller.dart';
import 'package:capstone_wms/controllers/lowerprice_controller.dart';
import 'package:capstone_wms/controllers/recommendation_cont.dart';
import 'package:capstone_wms/controllers/search_controller.dart';
import 'package:capstone_wms/screens/main/chatbot/chatscreen.dart';
import 'package:capstone_wms/screens/main/dashboard/recommend_list.dart';
import 'package:capstone_wms/screens/main/detail_gudang/detail_gudang_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String nameValue = '';

  Future<void> getLoggedInName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameValue = prefs.getString('name') ?? 'Jane Doe';
    });
  }

  String formatPrice(int price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: 'id_ID',
      decimalDigits: 0,
    );

    String formattedPrice =
        numberFormat.format(price / 1000000); // Convert to million
    print(formattedPrice);
    return '${formattedPrice} Jt/bln';
  }

  TextCollection textApp = TextCollection();
  FindController searchController = Get.put(FindController());
  RecommendationController recController = Get.put(RecommendationController());
  LowerPriceController lowPriceCont = Get.put(LowerPriceController());
  ChatbotController chatbotCont = Get.put(ChatbotController());
  TextEditingController searchCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInName();
    recController.getRecommendation();
    lowPriceCont.getLowPriceWarehouse();
    chatbotCont.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp().mainColorDarker,
        leading: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
            child: Obx(
              () => CircleAvatar(
                backgroundImage: NetworkImage(chatbotCont.isLoading.value
                    ? "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww"
                    :
                    // "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww",
                    chatbotCont.userInfo['photo']),
              ),
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, $nameValue",
              style: textApp.heading6.copyWith(
                color: ColorApp().light4,
              ),
            ),
            Text(
              "We're happy to see you today",
              style: textApp.smallLabel.copyWith(
                color: ColorApp().light4,
              ),
            )
          ],
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.notifications_rounded,
          //     color: ColorApp().light4,
          //   ),
          // ),
          Obx(
            () => IconButton(
              onPressed: chatbotCont.isLoading.value
                  ? null
                  : () {
                      Get.to(() => const ChatScreen(),
                          transition: Transition.rightToLeft);
                    },
              icon: Icon(
                Icons.chat_rounded,
                color: ColorApp().light4,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorApp().mainColorDarker,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextField(
                            controller: searchCont,
                            // onChanged: (value) {
                            //   searchController.searchString.value = value;
                            // },
                            onSubmitted: (value) {
                              searchController.clearWarehouseData();
                              searchController
                                  .onSearchSubmitted(searchCont.text);
                            },
                            style: textApp.bodySmall.copyWith(
                              color: ColorApp().light4,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorApp().light3.withOpacity(0.5),
                              hintText: "Search",
                              hintStyle: textApp.bodySmall.copyWith(
                                color: ColorApp().light4,
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: ColorApp().mainColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: ColorApp().mainColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorApp().light4,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorApp().light4,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Purwokerto, Banyumas",
                              style: textApp.smallLabel.copyWith(
                                color: ColorApp().light4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 155,
                        child: BannerWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5),
            //   child: SizedBox(
            //     height: 155,
            //     child: BannerWidget(),
            //   ),
            // ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Rekomendasi Untukmu",
                    style: textApp.bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const RecommendList());
                    },
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                // child: RecommendedCardWidget(),
                child: Obx(() => FutureBuilder(
                    future: recController.recommededData.isNotEmpty
                        ? Future.value(recController.recommededData)
                        : null,
                    builder: (context, snapshot) {
                      if (recController.isRecommendationLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorApp().mainColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null ||
                          recController.recommededData.isEmpty) {
                        return Center(
                          child: Text(
                            'Gudang Tidak Ditemukan',
                            style: TextCollection()
                                .bodySmall
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recController.recommededData.length,
                            itemBuilder: (context, index) {
                              var warehouse =
                                  recController.recommededData[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailGudangScreen(
                                      warehouseId: warehouse['id']));
                                },
                                child: SizedBox(
                                  width: 180,
                                  child: Container(
                                    margin: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorApp().dark4,
                                          offset: const Offset(1, 1),
                                          spreadRadius: 1,
                                          blurRadius: 1.0,
                                        )
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 130,
                                          child: warehouse['image'] != null &&
                                                  Uri.parse(warehouse['image'])
                                                      .isAbsolute
                                              ? Image.network(
                                                  warehouse['image'],
                                                  // width: 142,
                                                  // height: 227,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.network(
                                                      "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                                      // width: 142,
                                                      // height: 227,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                )
                                              : Image.network(
                                                  "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                                                  // width: 142,
                                                  // height: 227,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                warehouse['name'].toString(),
                                                // "Warehouse Abadi",
                                                overflow: TextOverflow.ellipsis,
                                                style: textApp.bodyNormal
                                                    .copyWith(
                                                        color: ColorApp().dark1,
                                                        fontSize: 16),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                warehouse['regencyName']
                                                    .toString(),
                                                // "Jakarta Barat",
                                                style:
                                                    textApp.bodySmall.copyWith(
                                                  color: ColorApp().dark1,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                formatPrice(warehouse[
                                                        'monthlyPrice'])
                                                    .toString(),
                                                style: textApp.bodyNormal
                                                    .copyWith(
                                                        color: ColorApp()
                                                            .secondaryColor,
                                                        // fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Gudang Termurah",
                    style: textApp.bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 244,
                width: double.infinity,
                // child: RecommendedCardWidget(),
                child: Obx(() => FutureBuilder(
                    future: lowPriceCont.lowPriceData.isNotEmpty
                        ? Future.value(lowPriceCont.lowPriceData)
                        : null,
                    builder: (context, snapshot) {
                      if (lowPriceCont.isLowPriceLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorApp().mainColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null ||
                          lowPriceCont.lowPriceData.isEmpty) {
                        return Center(
                          child: Text(
                            'Gudang Tidak Ditemukan',
                            style: TextCollection()
                                .bodySmall
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lowPriceCont.lowPriceData.length,
                            itemBuilder: (context, index) {
                              var warehouse = lowPriceCont.lowPriceData[index];

                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailGudangScreen(
                                      warehouseId: warehouse['id']));
                                },
                                child: SizedBox(
                                  width: 180,
                                  child: Container(
                                    margin: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorApp().dark4,
                                          offset: const Offset(1, 1),
                                          spreadRadius: 1,
                                          blurRadius: 1.0,
                                        )
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 130,
                                          child: warehouse['image'] != null &&
                                                  Uri.parse(warehouse['image'])
                                                      .isAbsolute
                                              ? Image.network(
                                                  warehouse['image'],
                                                  // width: 142,
                                                  // height: 227,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.network(
                                                      "https://images.unsplash.com/photo-1565610222536-ef125c59da2e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                                      // width: 142,
                                                      // height: 227,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                )
                                              : Image.network(
                                                  "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                                                  // width: 142,
                                                  // height: 227,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                warehouse['name'].toString(),
                                                // "Warehouse Abadi",
                                                overflow: TextOverflow.ellipsis,
                                                style: textApp.bodyNormal
                                                    .copyWith(
                                                        color: ColorApp().dark1,
                                                        fontSize: 16),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                warehouse['regencyName']
                                                    .toString(),
                                                // "Jakarta Barat",
                                                style:
                                                    textApp.bodySmall.copyWith(
                                                  color: ColorApp().dark1,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                formatPrice(warehouse[
                                                        'monthlyPrice'])
                                                    .toString(),
                                                style: textApp.bodyNormal
                                                    .copyWith(
                                                        color: ColorApp()
                                                            .secondaryColor,
                                                        // fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    })),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class RecommendedCardWidget extends StatelessWidget {
  RecommendedCardWidget({
    super.key,
  });

  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ganti pakai listview builder nanti
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 180,
          child: Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: ColorApp().dark4,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1.0,
                )
              ],
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warehouse Abadi",
                        style: textApp.bodyNormal
                            .copyWith(color: ColorApp().dark1, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jakarta Barat",
                        style: textApp.bodySmall.copyWith(
                          color: ColorApp().dark1,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "RP.10 Jt/bln",
                        style: textApp.bodyNormal.copyWith(
                          color: ColorApp().secondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  BannerWidget({
    super.key,
  });

  TextCollection textApp = TextCollection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2FyZWhvdXNlfGVufDB8fDB8fHww",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1589792923962-537704632910?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 155,
          width: 370,
          decoration: BoxDecoration(
            color: ColorApp().mainColorLighter,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 155,
                    width: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1586528116493-a029325540fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHdhcmVob3VzZXxlbnwwfHwwfHx8MA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 165,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: ColorApp().mainColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DigiHouse 11.11",
                            style: textApp.smallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "DISKON",
                            style: textApp.heading5.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                          Text(
                            "RP.2.000.000",
                            style: textApp.heading6
                                .copyWith(color: ColorApp().light4),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            height: 20,
                            width: 120,
                            decoration: BoxDecoration(
                              color: ColorApp().light3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Gudang, Purwokerto",
                              style: textApp.extraSmallLabel.copyWith(
                                color: ColorApp().secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "11-15 November",
                            style: textApp.extraSmallLabel.copyWith(
                              color: ColorApp().light4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
