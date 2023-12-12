import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final bool isUser;
  final String message;
  final String pfp;

  BubbleChat({required this.isUser, required this.message, required this.pfp});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser)
              const CircleAvatar(
                backgroundImage: AssetImage('assets/image/chatbot.jpg'),
                radius: 25,
              ),
            Flexible(
              child: Container(
                decoration: ShapeDecoration(
                  color: isUser
                      ? const Color(0xFF455D7F)
                      : const Color(0xFF17345F),
                  shape: isUser
                      ? const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ))
                      : const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                ),
                // height: double.infinity,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                // color: isUser ? colorApp.mainColorLighter : colorApp.mainColor,
                child: Text(
                  message,
                  style: TextCollection().bodySmall.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (isUser)
              CircleAvatar(
                backgroundImage: NetworkImage(pfp),
              )
          ],
        ),
      ),
    );
  }
}
