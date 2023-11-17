import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatItem({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = ColorApp();
    TextCollection textApp = TextCollection();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe) ProfileContainer(isMe: isMe),
              if (!isMe) const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(15),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80,
                ),
                decoration: BoxDecoration(
                  color: isMe
                      ? colorApp.mainColor.withOpacity(0.8)
                      : colorApp.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMe ? 15 : 0),
                    topRight: Radius.circular(isMe ? 0 : 15),
                    bottomLeft: const Radius.circular(15),
                    bottomRight: const Radius.circular(15),
                  ),
                ),
                child: Text(
                  text,
                  style: textApp.smallLabel.copyWith(
                    color: colorApp.light1,
                    fontSize: 14,
                  ),
                ),
              ),
              if (isMe) const SizedBox(width: 15),
              if (isMe) ProfileContainer(isMe: isMe),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).colorScheme.secondary : Colors.red,
          borderRadius: BorderRadius.circular(20)),
      child: CircleAvatar(
        backgroundImage: isMe ? null : AssetImage('assets/images/chatbot.jpg'),
      ),
    );
  }
}
