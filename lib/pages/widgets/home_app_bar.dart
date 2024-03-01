import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Text(
            "WhatsApp",
            style: TextStyle(fontSize: 20, fontFamily: "Helvetica"),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
