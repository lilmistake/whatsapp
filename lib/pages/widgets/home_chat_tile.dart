import 'package:flutter/material.dart';
import 'package:whatsapp/core/extensions/theme_extension.dart';
import 'package:whatsapp/models/models.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({required this.chat, super.key});
  final Chat chat;

  Widget deliveryStatus() {
    if (chat.latestMessage.isSelfSent) {
      if (chat.latestMessage.messageStatus == MessageStatus.notSent) {
        return const Icon(
          Icons.error_outline,
          size: 16,
          color: Colors.red,
        );
      } else if (chat.latestMessage.messageStatus == MessageStatus.notViewed) {
        return const Icon(
          Icons.done,
          size: 16,
          color: Colors.grey,
        );
      } else {
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Colors.grey,
        );
      }
    }
    return const SizedBox();
  }

  String get timeStampToTime =>
      DateTime.fromMicrosecondsSinceEpoch(chat.latestMessage.timestamp)
          .toString()
          .substring(11, 16);

  Widget subTitle() {
    String sender;
    if (chat.chatType == ChatType.group) {
      sender = chat.latestMessage.sender.name;
      sender += ": ";
    } else {
      sender = "";
    }

    if (chat.latestMessage.messageType == MessageType.string) {
      return Text(
        "$sender${chat.latestMessage.content}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        deliveryStatus(),
        SizedBox(
          width: chat.latestMessage.isSelfSent ? 5 : 0,
        ),
        Text(sender),
        const Icon(
          Icons.image,
          size: 16,
        ),
        const Text(" Photo")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chat.icon),
        ),
        title: Text(chat.name),
        subtitle: subTitle(),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Text(
                timeStampToTime,
                style: TextStyle(color: context.colorScheme.tertiary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
