import 'package:flutter/material.dart';
import 'package:whatsapp/core/extensions/theme_extension.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {},
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            icon: const Icon(Icons.people)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Chats",
                          style:
                              TextStyle(color: context.colorScheme.secondary),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              shape: BoxShape.circle),
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            "19",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: context.colorScheme.background),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(999)),
                      margin: const EdgeInsets.only(top: 8),
                      height: 2,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text("Updates",
                    style: TextStyle(color: context.colorScheme.tertiary),
                    textAlign: TextAlign.center),
              ),
              Expanded(
                child: Text(
                  "Calls",
                  style: TextStyle(color: context.colorScheme.tertiary),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
