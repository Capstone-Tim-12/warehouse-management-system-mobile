import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class VerifikasiIdentitas extends StatelessWidget {
  const VerifikasiIdentitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorApp.dark4, //change your color here
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorApp.secondaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Verifikasi Identitas",
          style: TextCollection().heading5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(),
                      image: const DecorationImage(
                          image: AssetImage("assets/image/images.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "NIK", border: InputBorder.none),
                      controller: TextEditingController(
                          text:
                              "29846112648226"), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Nama",
                        border: InputBorder.none,
                      ),
                      controller: TextEditingController(
                        text: "Yuniar Awaliyah",
                      ), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "Tanggal Lahir", border: InputBorder.none),
                      controller: TextEditingController(
                        text: "09-12-1988",
                      ), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "Jenis Kelamin", border: InputBorder.none),
                      controller: TextEditingController(
                        text: "Laki-laki",
                      ), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "Tempat Lahir", border: InputBorder.none),
                      controller: TextEditingController(
                        text: "Depok",
                      ), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "Pekerjaan", border: InputBorder.none),
                      controller: TextEditingController(
                        text: "Wiraswasta",
                      ), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: colorApp.dark4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: "Kewarganegaraan",
                          border: InputBorder.none),
                      controller: TextEditingController(
                          text: "WNI"), // You can set an initial text if needed
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: colorApp.secondaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: colorApp.light1,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Ubah Identitas",
                              style: TextStyle(color: colorApp.light1),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
