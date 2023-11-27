import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/components/dashboard_bannerCard.dart';
import 'package:capstone_wms/components/dashboard_cardItem.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp().mainColorDarker,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww",
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Digia",
              style: TextCollection.heading6.copyWith(
                color: ColorApp().light4,
              ),
            ),
            Text(
              "We're happy to see you today",
              style: TextCollection.smallLabel.copyWith(
                color: ColorApp().light4,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              color: ColorApp().light4,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_rounded,
              color: ColorApp().light4,
            ),
          ),
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
                            style: TextCollection.bodySmall.copyWith(
                              color: ColorApp().light4,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorApp().light3.withOpacity(0.5),
                              hintText: "Search",
                              hintStyle: TextCollection.bodySmall.copyWith(
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
                              style: TextCollection.smallLabel.copyWith(
                                color: ColorApp().light4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 130.0),
                  child: SizedBox(
                    height: 155,
                    child: BannerWidget(),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Rekomendasi Untukmu",
                    style: TextCollection.bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: RecommendedCardWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Gudang Termurah",
                    style: TextCollection.bodySmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 244,
                width: double.infinity,
                child: RecommendedCardWidget(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
