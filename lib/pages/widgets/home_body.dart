import 'package:flutter/material.dart';
import 'package:whatsapp/core/data.dart';
import 'package:whatsapp/core/extensions/theme_extension.dart';
import 'package:whatsapp/models/models.dart';
import 'package:whatsapp/pages/widgets/home_chat_tile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateRandomChats(20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text("Error");
          }

          List<Chat> chats = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  color: context.colorScheme.background,
                  child: ChatTile(
                    chat: chats[index],
                  ));
            },
          );
        });
  }
}
