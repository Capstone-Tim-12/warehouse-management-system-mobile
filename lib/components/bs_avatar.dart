import 'dart:convert';

import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:capstone_wms/services/avatar_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void bottomSheetAvatar(BuildContext context) {
  AvatarService avatarService = AvatarService();
  late Future<List<dynamic>>? avatarData;
  bool isLoading = false;

  Future<void> getAvatarData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    avatarData = null;
    isLoading = true;

    try {
      final response = await avatarService.getAvatar(prefs.getString('token')!);

      Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['data'] != null) {
          List<dynamic> avatarList = responseData['data'];
          avatarData = Future.value(avatarList);
        } else {
          avatarData = null;
        }
      }
    } catch (e) {
      print(e);
      avatarData = null;
    } finally {
      isLoading = false;
    }
  }
  
  getAvatarData();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
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
                SizedBox(height: 20),
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
                          child: Text('No data found'),
                        );
                      } else {
                        return GridView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 18.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var avatar = snapshot.data![index];
                            return CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(avatar['image']),
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
        },
      );
    },
  );
}
