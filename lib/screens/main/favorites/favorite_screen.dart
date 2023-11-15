import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ColorApp colorApp = ColorApp();
  final TextCollection textCollection = TextCollection();

  final List<Map<String, dynamic>> items = [
    {
      'imageURL':
          'https://s3-alpha-sig.figma.com/img/4dd7/cdef/186384b0004738973918693df2770523?Expires=1700438400&Signature=QeRDVkX2rVOV1cWb91H7TAYsJI4II1KQiodWcB6D8OVtSYhPlPa~AvbWV06wqdfgtynOQaddBdQRAUK6gPzAL0uEJUv05gMf7etv0SjsBywbTP4j97EcEY7HGGyQvN6zLMvnn5U6zX7qzbdit1vPjDtQLA0Ir-J7RrXLWJXXmQokOMsHLOKcgkyqq-WvHJCsrX4D3FMa9SmrK4WaRIAkXfMS~xl2pUOM6YQgS3C9izkuCLEHlmBW~JyWLoABUOA8r5Lownu~BpBTnaU8O8F4Qrgwt5xiO-nx86ilXBG1Qr6jidZ4UKykczjWLt4Qt1W~jA~3HRtZGrrQ7Ia~qOY5dg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'title': 'Gudang',
      'name': 'Warehouse Abadi',
      'location': 'Jakarta Barat',
      'landArea': '1.396 m²',
      'buildingArea': '1.348 m²',
      'price': 'Rp. 107.840.000/bln',
    },
    {
      'imageURL':
          'https://s3-alpha-sig.figma.com/img/c6d4/c288/e966b58e23a25382ea166b2e1d0e99a9?Expires=1700438400&Signature=NP3W8opT96YveizTRhKsfNqrPEXe9vC8VSJUYQr0VKwHjCu-47aKMT41aeO5yOnkpCApc8rMXwXr8b~gak-uP8sRc9j6wj-b-d~Xtc3L1KX1cSwX3WZo1fdzGWGT1~7s4MPr4MEKZdFd7IT-im0Vg~MvZdL3VJeoYLjBGfWjKIH~MQB58oZVpLofh7~DFgs~0xMPqXkdcHflng3nMUKqON9f-Ad2vnp-Snp3djfnpHHIwwNq4V0eHTOKDfod98DDMpuaPkFtRyLK2IElzzrXDb6E0qgURtMcPblZoTiJ7d4Uw1RlX02dx7nvlIgz~24QEDsgwpKNYT5~PIDLZNJDvg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'title': 'Gudang',
      'name': 'Adhi Jaya Gudang',
      'location': 'Purwokerto',
      'landArea': '440 m²',
      'buildingArea': '300 m²',
      'price': 'Rp. 24.000.000/bln',
    },
    {
      'imageURL':
          'https://s3-alpha-sig.figma.com/img/28c4/107f/cafa129b2dd320b8ea90a11d26b2f656?Expires=1700438400&Signature=Qkc9cqPqV9XslSJ8M~gu8Zs-~rVZe9bxcsCr5Few55nVTDAOjKsscGLpm8QpdzuVarjQPyY4PBaNGPwl6YR5nhsU12nrMgCqcOaK747dxX12ioNMsmttj5BNUb59e9-ChUs6bTA8~wp5kn4yaIbeSGypXlYkMzR6ExzhvFPY26FcyYyXzZu0vtn9nsU~EG3LNROs5boezLqo5zxpi6m9D1-xpWh9cyyaTf4vPLs1UpRkpONZ5EGZ8omwc37IM-yLQNKxP93AD2ABFl16V2nM0qI2JcE0FPmZJIibc-hgAAq~5UAyWINOgacci5EZN7NLtlXsmOX3vOcahl1tLXEcVg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'title': 'Gudang',
      'name': 'Adhimetal group',
      'location': 'Jakarta Selatan',
      'landArea': '550 m²',
      'buildingArea': '350 m²',
      'price': 'Rp. 28.000.000/bln',
    },
    {
      'imageURL':
          'https://s3-alpha-sig.figma.com/img/a222/166d/a4e437c7b4cefeff125e392fc21a727c?Expires=1700438400&Signature=gEREaJyKBpAhm-0s6ssz7-AxGLMQcnY9FXVmPiLG20vDGDnwNem~mBQmgUITYc1VAPxDSBSLiAqrk~aMBb78HCsZgAnKxGef9deTCOtHo76ekwWm7q940z09aZRNZ5XXV~puc9~GIEJQ1ysaF8MIZpVbGQGfGkbbDaJh3TvnWy2GQXQPxZDrbYimCntfhJ4ojMJgyfYyvXgma-oVQb34-GPP7ypE3~z6gZB3ZHYIwNL9J9kgNpt6wQ2u~qwRdH0~sh2Rlm3fr3KvLdXrEHOtoghZlDQRJ11IhJPQxr309P6Z2D5L19uE9wiheMLoPE~WGK9GrnWg1hB9lbYw995JOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'title': 'Gudang',
      'name': 'Marga Jaya',
      'location': 'Purwokerto Barat',
      'landArea': '660 m²',
      'buildingArea': '500 m²',
      'price': 'Rp. 40.000.000/bln',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite', style: textCollection.heading6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, int index) {
              final item = items[index];
              return Column(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: colorApp.dark4,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item['imageURL'],
                              width: 142,
                              height: 227,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Container(
                                  width: 80,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: colorApp.dark1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['title'],
                                        textAlign: TextAlign.center,
                                        style: textCollection.bodySmall
                                            .copyWith(
                                                color: colorApp.mainColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  item['name'],
                                  style: textCollection.bodyNormal
                                      .copyWith(color: colorApp.mainColor),
                                ),
                                // const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['location'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: colorApp.mainColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(Icons.crop_square,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['landArea'],
                                      style: TextStyle(
                                        color: colorApp.mainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.apartment,
                                        color: colorApp.mainColor),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        item['buildingArea'],
                                        style: TextStyle(
                                          color: colorApp.mainColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['price'],
                                  style: textCollection.bodySmall
                                      .copyWith(color: colorApp.mainColor),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.star,
                              color: colorApp.mainColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
