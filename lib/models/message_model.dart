import 'package:whatsapp/models/enums.dart';
import 'package:whatsapp/models/user_model.dart';

class Message {
  final bool isSelfSent;
  final User sender;
  final int timestamp;
  final MessageStatus? messageStatus;
  final MessageType messageType;
  final String content;

  Message(
      {required this.sender,
      required this.isSelfSent,
      required this.timestamp,
      required this.messageStatus,
      required this.messageType,
      required this.content});
}
