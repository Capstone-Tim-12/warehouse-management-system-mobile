import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class EmailVerifikasi extends StatelessWidget {
  const EmailVerifikasi({super.key});

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
          "Pengaturan Email",
          style: TextCollection().heading5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Card(
                elevation: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: colorApp.mainColorDarker,
                        child: Icon(
                          Icons.email,
                          color: colorApp.secondaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Yuniar12@example.com",
                        style: TextCollection().bodyNormal,
                      ),
                      const SizedBox(height: 2),
                      const Text("Email terverifikasi"),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: colorApp.secondaryColor,
                                              ),
                                            ),
                                            Text(
                                              "Email",
                                              style: TextCollection().heading5,
                                            ),
                                            const SizedBox(
                                              width: 120,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      colorApp.secondaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  "Kirim Kode",
                                                  style: TextCollection()
                                                      .bodySmall,
                                                  selectionColor:
                                                      colorApp.light1,
                                                ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: "Email",
                                              icon: Icon(Icons.person),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: colorApp.secondaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Ubah Alamat Email",
                              style: TextStyle(color: colorApp.light1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Card(
                elevation: 1,
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "FAQ",
                          style: TextCollection().bodyNormal,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Bagaimana cara mengubah alamat email ?",
                          style: TextCollection().bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_right_rounded),
                          color: colorApp.mainColorDarker,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Bagaimana agar alamat email dapat terverifikasi ?",
                          style: TextCollection().bodySmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_right_rounded),
                          color: colorApp.mainColorDarker,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
