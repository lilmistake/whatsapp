import 'dart:math';

import 'package:whatsapp/pages/home_page.dart';
import 'package:whatsapp/models/models.dart';
import 'package:whatsapp/models/user_model.dart';

String lipsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

String generateRandomText() {
  return lipsum
      .split(" ")
      .sublist(0, Random().nextInt(lipsum.split(" ").length))
      .join(' ');
}

Future<List<Chat>> generateRandomChats(int count) async {
  List<User> randomUsers = await User.random();
  List<Chat> chats = [];
  for (int i = 0; i < count; i++) {
    print("Genereated User ${i + 1}/$count");
    ChatType randomChatType = ChatType.values[Random().nextInt(2)];
    bool isSelfSentMessage = Random().nextBool();
    MessageType randomMessageType = MessageType.values[Random().nextInt(2)];
    MessageStatus? randomMessageStatus;
    String randomMessageContent;
    String icon, chatName;
    User randomUser = randomUsers[i];
    User sender = isSelfSentMessage ? loggedInUser : randomUser;

    if (randomChatType == ChatType.personal) {
      icon = randomUser.picture;
      chatName = randomUser.name;
    } else {
      icon = "https://picsum.photos/200?${Random().nextInt(100)}";
      chatName = generateRandomText().split(" ").sublist(0, 2).join(" ");
    }

    if (isSelfSentMessage) {
      randomMessageStatus = MessageStatus.values[Random().nextInt(3)];
    }

    if (randomMessageType == MessageType.image) {
      randomMessageContent =
          "https://picsum.photos/200?${Random().nextInt(100)}";
    } else {
      randomMessageContent = generateRandomText();
    }

    Chat chat = Chat(
        chatType: randomChatType,
        icon: icon,
        name: chatName,
        latestMessage: Message(
          isSelfSent: isSelfSentMessage,
          messageType: randomMessageType,
          messageStatus: randomMessageStatus,
          content: randomMessageContent,
          sender: sender,
          timestamp: // random timestamp in last 24 hours
              DateTime.now()
                  .subtract(Duration(
                      hours: Random().nextInt(24),
                      minutes: Random().nextInt(60)))
                  .microsecondsSinceEpoch,
        ));
    chats.add(chat);
  }
  return chats;
}
