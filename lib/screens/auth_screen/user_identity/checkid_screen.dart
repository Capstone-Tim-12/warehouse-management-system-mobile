import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/edit_address.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/edit_identity.dart';
import 'package:capstone_wms/screens/auth_screen/user_identity/panduanselfiektp.dart';
import 'package:flutter/material.dart';

class CheckIdentity extends StatefulWidget {
  const CheckIdentity({super.key});

  @override
  State<CheckIdentity> createState() => _CheckIdentityState();
}

class _CheckIdentityState extends State<CheckIdentity> {
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorApp.bgAuthScaffold,
        appBar: AppBar(
          backgroundColor: colorApp.bgAuthScaffold,
          title: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.stateSuccess,
                  shape: const OvalBorder(),
                ),
                child: Icon(
                  Icons.check,
                  color: colorApp.light1,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 12,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: const ShapeDecoration(
                  color: Color(0xFF0063F7),
                  shape: OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '2',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Cek Data',
                style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 2,
              ),
              Container(
                // width: double.infinity,
                width: 125,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: ShapeDecoration(
                  color: colorApp.light1,
                  shape: const OvalBorder(),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
              ),
            ],
          ),
        ),
        body: Stack(children: [
          Padding(
            padding: paddingApp.scaffoldPadding,
            child: ListView(children: [
              Text(
                'Cek Data Diri dan Alamat',
                style: textApp.heading3.copyWith(fontSize: 27),
              ),
              Text(
                'Pastikan datamu sesuai dengan data KTP. Silahkan ubah jika ada yang keliru.',
                style: textApp.bodyNormal.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Data Diri',
                        style: textApp.bodyMedium,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditIdentity()));
                        },
                        child: Text(
                          'Ubah',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'NIK',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          '32023891327891',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nama Lengkap',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Abdulrahman',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jenis Kelamin',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Laki-Laki',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tempat Lahir',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Depok',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tanggal Lahir',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          '11-09-2001',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pekerjaan',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Pelajar/Mahasiswa',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kewaranegaraan',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'WNI',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Alamat di KTP',
                        style: textApp.bodyMedium,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditAddress()));
                        },
                        child: Text(
                          'Ubah',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Negara',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Indonesia',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Provinsi',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Jawa Barat',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kota/Kabupaten',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Depok',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kecamatan',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Cimangis',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alamat',
                              style: textApp.bodyNormal.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                        Text(
                          'Mekarsari no.51',
                          style: textApp.bodyNormal
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ]),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: colorApp.bgAuthScaffold,
                // height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorApp.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PanduanSelfieKTP()));
                          },
                          child: Text('Lanjut Selfie KTP',
                              style: textApp.largeLabel.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
              ))
        ]));
  }
}
