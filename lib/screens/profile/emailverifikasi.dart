import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class EmailVerifikasi extends StatelessWidget {
  const EmailVerifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: colorApp.dark4,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        "pengaturan Email",
                        style: TextCollection().heading5,
                      )
                    ],
                  )
                ],
              ),
            ),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
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
