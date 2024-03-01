import 'package:whatsapp/models/enums.dart';
import 'package:whatsapp/models/message_model.dart';

class Chat {
  final ChatType chatType;
  final String icon;
  final String name;
  final Message latestMessage;
  final int unreadCount;

  Chat(
      {this.unreadCount = 0,
      required this.chatType,
      required this.icon,
      required this.name,
      required this.latestMessage});
}
