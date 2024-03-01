import 'package:flutter/material.dart';
import 'package:whatsapp/core/extensions/theme_extension.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/pages/widgets/home_app_bar.dart';
import 'package:whatsapp/pages/widgets/home_body.dart';
import 'package:whatsapp/pages/widgets/home_nav_bar.dart';

User loggedInUser = User(name: "You", picture: "https://picsum.photos/200");

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    color: context.colorScheme.primary,
                    child: const Column(
                      children: [
                        HomeAppBar(),
                        HomeNavigationBar(),
                      ],
                    ),
                  ),
                  const HomeBody()
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: context.colorScheme.secondary,
          child: const Icon(Icons.message),
        ));
  }
}
