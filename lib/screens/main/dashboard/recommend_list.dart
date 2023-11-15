import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';


class RecommendList extends StatefulWidget {
  const RecommendList({super.key});

  @override
  State<RecommendList> createState() => _RecommendListState();
}

class _RecommendListState extends State<RecommendList> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  List<Map<String, dynamic>> warehouses = [
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/fc21/204d/10045161a8f19874d6bd5b3e34e3dfdb?Expires=1700438400&Signature=md906u2ssXQ5L~G4Zz0mkM2Cv2vHuzRN3CP~7wjIsJhblwHXwaSjP34hKV9RYs98z9Gq3RdwoU2zG7rvS1IvA0Rg1-rDrYwKnY156zhKffidUpr-ZGXBY-rOlHjJoKA5M2mOXUHn~8mnNstxFic4GUPXDoIZdx19BwoVgTmdC8wplsidWXY8wLHiLr9A07uE~rVlqyvbjvdVaTQaICxr5tmPDdtJOqtX1DRIzyeQ8cDBXTApOKRpzeqkSO6hiTth9gFZWK4SSLJ7~MSb2QBCjdD2OSMYQENlRXASImahnrQDxRhdWkAp4an8uBMuoUaaSTA~CvKRInyJw7XJJ9qinw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Jaya Baya',
      'location': 'Baturaden, Purwokerto',
      'price': 'Harga',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/d80e/28c3/0ac50ba081e3f8d8fd516ea6f2c68a90?Expires=1700438400&Signature=Y6IwRUXoyOmHo75PKO131QUh180rV8E~TDdG-JyP-~w~xnDY8SReOmc6qR9AupYeMs9y9zWg7cc~DagRk8LvapoBli6UYfFZdKW7drPDKNasVFK49S6D9wPkhBpe9JBDGDIZyvQxzDF90pXC2Fo8D-mFiwBWoH0MLV4xqnWwGAPJxyfgQSVURafC2sYSQoMyZf1uKEfNfmCHXkJk7rrOdmgYxmjoSe80ih3bNEgp6p0D4Is9F4ESwhz67qfnGwM7KZH0dv9Bscbu2rt2nf94L0rZBgrxKWywu7EQzwA~18SUX68Es-FFX89HmcYr2HkpfTS648elt-64gNote0q6iw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Warehouse C',
      'location': 'Lokasi',
      'price': 'Harga',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/8fea/7987/ad663a1ae6e9c510e8a94f4d686c8d49?Expires=1700438400&Signature=Pz2Tci-XhtYDmdbgPl568DUz~VOnOw-eP~VUXLsgRC93Tho4xDMmdzajfMtXeiZmDBBZ6onlhMlSzKMlCOGW3sIiw7YdXvwbin74HLvvL0BLT0eyyWIpiFCE0mx5oJxrxMHGGPvMxjItxm7xBKzW4mHh47I2M7EH-sww2YtlMxksgzLEHObfhV1jSsOdsPN-YMUg2TL4ggMRThZmtXLD9AiZ0ZHtXghp9Q2O1DEiSbqz1U6qOR65RgCk81aCVJHtlg9PdDrpMURnmxXWKtVntabe7YtxJ1n0PSbG4SrRScyyiMLGWwKbdgbN9wn5bIOaHYl9peCFhgSsjj-9zJ2WVA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Warehouse D',
      'location': 'Lokasi',
      'price': 'Harga',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/8fea/7987/ad663a1ae6e9c510e8a94f4d686c8d49?Expires=1700438400&Signature=Pz2Tci-XhtYDmdbgPl568DUz~VOnOw-eP~VUXLsgRC93Tho4xDMmdzajfMtXeiZmDBBZ6onlhMlSzKMlCOGW3sIiw7YdXvwbin74HLvvL0BLT0eyyWIpiFCE0mx5oJxrxMHGGPvMxjItxm7xBKzW4mHh47I2M7EH-sww2YtlMxksgzLEHObfhV1jSsOdsPN-YMUg2TL4ggMRThZmtXLD9AiZ0ZHtXghp9Q2O1DEiSbqz1U6qOR65RgCk81aCVJHtlg9PdDrpMURnmxXWKtVntabe7YtxJ1n0PSbG4SrRScyyiMLGWwKbdgbN9wn5bIOaHYl9peCFhgSsjj-9zJ2WVA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Warehouse E',
      'location': 'Lokasi',
      'price': 'Harga',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://smartlegal.id/wp-content/uploads/2023/09/Tanda-Daftar-Gudang-jpg.webp',
                        width: 378,
                        height: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      Text(
                        'Categories',
                        style: textCollection.heading6
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: warehouses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 16, top: 16),
                          width: 380,
                          height: 142,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  warehouses[index]['image'],
                                  width: 142,
                                  height: 110,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      warehouses[index]['name'],
                                      style: textCollection.bodySmall
                                    ),
                                    const SizedBox(height: 2),
                                    Text(warehouses[index]['location'], style: textCollection.smallLabelBlackclear),
                                    const SizedBox(height: 53),
                                    Text(
                                      (warehouses[index]['price']),
                                      style: textCollection.smallLabelBlackclear
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
