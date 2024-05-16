import 'package:flutter/material.dart';
import 'package:gallery/resources/strings_manager.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
        title: Row(
          children: [
            SizedBox(height: 100,)
          ],
        ),
    );
  }
}
