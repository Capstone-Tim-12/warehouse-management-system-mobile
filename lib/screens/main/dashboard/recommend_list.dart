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
          'https://s3-alpha-sig.figma.com/img/3912/791d/eee9f5568ffc8e8df7c4b7e0f21067be?Expires=1701043200&Signature=Qe-AWgc1pfTvaoA94X23ouyhBFLH2D588bvWhrHiLzoIRuYIcGChNKYAX3x2t3~0XgJSenIahQSF7zvr1gtElyrKUt8usjfEVw3iJALNSypKvcS2yUccXnd-9tAlzKryD45r~6ciqUQiSUgAuw06MgixWGNOkzA93nkTL0ZMUMiJB3FtT~NY1LaZcQD~JnWQOt1jm2dqo~FAZI1DcQaRN5JDu8sW5C5FBJ0B~dkd1UmXK493JZ21JpwVlqDOwq39rGquOTxMz~9JE2dHzHivlk56fudocGF3Gw2wEKobdCGsV75Gvmi8iBypoS6V39kgsUYFVzX8ayR8Q7GgLpd8WA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Warehouse Abadi',
      'location': 'Jakarta Barat',
      'buildingArea': '1200 m²',
      'price': 'Rp10.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/e2bc/07b4/dbc2e861b10e15cad8ab19f46371709c?Expires=1701043200&Signature=dr-L0wDYlJexBgvXanYaBR~OOYA-xku3cl6Yq-EIGFnEJa8eqO3~f~d4X8R6BNUk0WGKRnMQCI3NWK0AfeY9-e1W611Yp0TDuzHgoD38G2-Q-B0eRlCdzQj0NHOQPuAxBR-fhiKUA6Td~R3DZhas2nCSFysIG55D~y7U1zNnRrMV4Dln7SuPqO22p3lHXv6YW3MSx3XDVFgkL3hCtvGZLx7xem9YWocaO2Uvkw5~ntY5B1SalgFDzbAr~tnb03PmHE~GKkmBhgRwJg8xHUCyMY92wvKxZICoHMGamSWN7LZ1PLbQsKol5PzbvHdnAS6ZNrdkdEqvbdg~D9A6oMBsNw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Mega Storage Center',
      'location': 'Jakarta Barat',
      'buildingArea': '1000 m²',
      'price': 'Rp40.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/3912/fa01/6831a379b024892f742d0c76a2295629?Expires=1701043200&Signature=E~0f4AaLC1Wx0~lnVKnxi-3tuz8AMdCl49B4-XVO4xe8BwoSKjzVcEBSZ95wg~v6GUx1Cu08ed8EWRwLc9jRU0dzlBjHRgQANUqqTXd1T8dTnhieAqaGPealYPoXg95YCeFdBIpOxx4LqjPiGpT5HwkONL-6lwNP74kOrBVwYa65frQxdMTD6~Rn5txo-OADTJ7ynr84V4CfbUg1vVmlKKjZ7bE92b8vnHAGOhif6HJ2oh0oTTL35yAt06~K-MDlieAr0yvBGbofnSwfTjJvvkKHTCRH8FCSfksO1~FtLFdMFJjpQec8Qa-zBkdVXiHuPGwUPScHedAsAUOTzspxHA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Harmoni Warehouse',
      'location': 'Jakarta Barat',
      'buildingArea': '2000 m²',
      'price': 'Rp80.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/d557/5ef6/cb8ab19999bbd7c0c1562b4b3e496c1d?Expires=1701043200&Signature=IL1pv2vvK5DfwtLGR7YCI5dgFSzqb~x4pK1b~iQUuBDwSrZgkqs7GvDJlkmqkFYWci7mQFVQIirypbVwLwxOUqUOvtwurJSP84YXyDpa3WGwV6I0UBx1xcbbfHUL3VoyXw4naXyYBt7lJqYNh9dkzC~plAHVgPfh1g6r4kFbsUTebetIH8kiN0e8zJgS5biMbVKZQ2Ul4p6cOc7fyMeuZj9fA5sWM9umZdcC-I483NuVwqCxRA34ISCOFzdViafNwu9S8RTywueMMHB8G1UjrB3StqoOZlzIVtsIv6LfMxcbc6PaQz8ot0W6xW5A4pGw2Y-7qXeQXnWas8B4HijKsw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Jaya Baya',
      'location': 'Jakarta Timur',
      'buildingArea': '500 m²',
      'price': 'Rp16.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/b92b/ff55/1a77830a75473788a07c4cf66c465790?Expires=1701043200&Signature=DXfdXJe0ObwMKi0deTdxoZIXjnicO1Bu7ZQonPczT2u3DHhpiqEUiNgBeRzpQsA3f9jZ9dTbMEAsZDzMc34r9wXMKuxhwZQu5I~9QwBh3JXJKnU-n-m54aDu4sdVMC~zTdFjA3mzX8KsAd9r~YEvTm1~EQxQYokezFlxHXwrRextAbkjcKjp8A7b5VYxRglXHF7ijIKZiv~SHxhAKvL9lQdbSbWaavOrYadQ423VT8qOcW8mUvfG7gu9Bk~1hTcgCpPQ93~Mkd8BUsh5BZ1bAbEC2q7LWTFXDilVLZwrOidFIeBdImxuv5yAsdb5QwyCLsNRQc96YB7fVfrBKzF9pw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Amanah Warehouse',
      'location': 'Jakarta Barat',
      'buildingArea': '1500 m²',
      'price': 'Rp60.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/17b4/60e5/16b93e42efd80372fe148125d28e4ecc?Expires=1701043200&Signature=Im4ZUOk8RUh2tlu~YYAA3umZQrpiIFN8FRCdcWE9qR8NWpjplw9O9LmHXgMNoTPiMwB23j0I4GcEnyCdIbOzEzkiOtbaOva2bvSxVnuoppY~r3NsAtEh1CIdWmrbgdTIyH~8ksSldxh4zFDaRZEXZgOPS9oIH2zi8uR1SZ6LdmmUf3or-Pd7HF6kT6fH4rxNPCaQGDLAzv8GYyqkOWILfpWCQc25dOGpdywjX~9t4fG2a0LrCMXENg7-zRVGt61mcZeIhvhiGdaMqolpcYS1BzFnXTot5x9JqoOPVrniZQRK2W8owhyJUf63kcifF8mH8BrPSn4oIhe4GK1z3LX6cQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Adhimetal Group',
      'location': 'Jakarta Selatan',
      'buildingArea': '550 m²',
      'price': 'Rp28.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/27b0/5fd5/6e100f2f22933d50d6261915449d24d3?Expires=1701043200&Signature=YBmPnWwvb8YB-WxCcciCJXiFwKe4daTgdxDbGPqWBi599u5SHeQS9dHMfgKZSIAJjfQkKqAWSMIqcIF29XSIWuBlY1W8LHWH3KMQxM1runXS8SujgVpG-HXaDdokfCB5qUUu4FQcq0dh2apRg~g0p7xUBmA8w8b~Xd1-4OtGmop8WWgOZpYviG2X9zz1E3dfgyegrU~HiFjjx4omXFHMyC5JXGtxqjpj7nJA72mERVL~mpAUqHb6HfTiE7W-mHNs~MevX0807zrazrUHlSTgM5Schh3kpMboVQyzCRcgaipLJ67BCSneHxRsaaEx~BJBn2SZlhxb1rMGx4eF7h4~0w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Gudang Idaman',
      'location': 'Jakarta Timur',
      'buildingArea': '620 m²',
      'price': 'Rp30.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/6cc9/62cb/0e2d1dd243d2c5838dd0347861b884c5?Expires=1701043200&Signature=COkblWxh2nlEtEp65-ozZhRlnc-c4Aaqmgt9W9ErOT2k2qJlLj-VuM3ikmBDnkWEMxSWc2U5BApZGjzKHMsNiKM30uaph6MbK5~98z4LQMshoF48o~3Vuca90UxfIZqlaospsSyp9Fl7xl6Hw2ER5-roDE7aD1yJ3bv0H2z6ygx2Vj7IDfR12VGq6po7wWzYoRBYPiDAnnTyhPot8v3mTT19V8~JeVYx9rGuioPn54hFwfoGNNN58ecggNGPcrb29bk71b2Bj8Len0n6uFrMng9urMhzFEyqzE5UUueewrBLW1iQdKcch6N3~re39kacG65ihlsUhOdRFI-2vUeNVA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Arum Warehouse',
      'location': 'Depok',
      'buildingArea': '1000 m²',
      'price': 'Rp44.000.000,00/bulan',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/8905/ec8b/2ba70201e14e21d5ea633a682cf3044a?Expires=1701043200&Signature=PKeS801iYAKSunr~uOLaj5ZlavdCk1Nc-rZFB4-JqKwmAtBEYF0l0I3u3IivjnhBKRq~1Mpy2xQIxdhA6CJ0Y-cy1Nu-BiGW8dTQVfiu9r4KyEfv2Wv1EOuq8WUXPkCgdfyB6nU-WH8WJVudbBivPdpYZuSl3TNe21Qy6WgDetzl3HXZhucG5r1SIs9dg30c5~ERyN-~qzqEPLyohqdi83Uhrb0~t4zwLZol3QphffoYTtw3zdUFO5yf20OQ~vkV3ycCLD2cNnzaoQBq2l03GVFV0kJ9U8SWSIGgwi3MvCvweDLg~eONbVSbgdC7TRDBnnbGoJUfbcAq0lWrNBWNUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'name': 'Gudang Gula Merah',
      'location': 'Tangerang Selatan',
      'buildingArea': '700 m²',
      'price': 'Rp45.000.000,00/bulan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi', style: textCollection.heading6.copyWith(color: colorApp.mainColor)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25, top: 15, right: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Rekomendasi',
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
                          width: 380,
                          height: 160,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12), 
                                  bottomLeft: Radius.circular(12)),
                                child: Image.network(
                                  warehouses[index]['image'],
                                  width: 142,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            warehouses[index]['name'],
                                            style: textCollection.heading6.copyWith(color: colorApp.mainColor),
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: colorApp.mainColor,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        warehouses[index]['location'],
                                        style: textCollection.bodyNormalLight.copyWith(color: colorApp.mainColor),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        warehouses[index]['buildingArea'],
                                        style: textCollection.bodyNormalLight.copyWith(color: colorApp.mainColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        warehouses[index]['price'],
                                        style: textCollection.bodySmall.copyWith(color: colorApp.mainColor),
                                      ),
                                    ],
                                  ),
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
