import 'dart:convert';

import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/controllers/profile_controller.dart';
import 'package:capstone_wms/services/avatar_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarBottomSheet extends StatefulWidget {
  const AvatarBottomSheet({super.key});

  @override
  State<AvatarBottomSheet> createState() => _AvatarBottomSheetState();
}

class _AvatarBottomSheetState extends State<AvatarBottomSheet> {
  ProfileController profilCont = Get.put(ProfileController());
  AvatarService avatarService = AvatarService();
  late Future<List<dynamic>>? avatarData;
  bool isLoading = false;

  Future<void> getAvatarData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      avatarData = null;
      isLoading = true;
    });

    try {
      final response = await avatarService.getAvatar(prefs.getString('token')!);

      Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] == null) {
          setState(() {
            avatarData = null;
          });
        } else {
          List<dynamic> avatarList = responseData['data'];
          setState(() {
            avatarData = Future.value(avatarList);
          });
        }
      } else {}
    } catch (e) {
      print(e);
      setState(() {
        avatarData = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    avatarData = null;
    getAvatarData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: colorApp.secondaryColor,
                ),
              ),
              Text(
                'Photo Profile',
                style: TextCollection().bodyNormal.copyWith(
                      color: colorApp.mainColor,
                    ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: avatarData,
              builder: (context, snapshot) {
                if (isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colorApp.mainColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data == null || avatarData == null) {
                  return const Center(
                    child: Text('No Avatar found'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var avatar = snapshot.data![index];
                      return InkWell(
                        onTap: () async {
                          await profilCont.updatePFPwithAvatar(avatar['image']);
                          await profilCont.getUserInfo();
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(avatar['image']),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void bottomSheetAvatar(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    context: context,
    builder: (BuildContext context) {
      return const AvatarBottomSheet();
    },
  );
}
