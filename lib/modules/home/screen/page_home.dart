import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppbarHome(),
      body: Column(
        children: [],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //     icon: Icon(IconlyBold.home),
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(IconlyBold.home),
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(IconlyBold.home),
      //   ),
      // ]),
    );
  }
}

class _AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHome({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 101);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      color: CustomColor.primary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              // Icon(IconlyLight.arrow_left),
              CircleAvatar(
                radius: 20,
                backgroundColor: CustomColor.grey,
                backgroundImage: AssetImage('assets/default_profile.png'),
              ),
              const SizedBox(width: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: CustomTextStyle.body3Regular
                        .copyWith(color: CustomColor.white),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Agung Nurcahyo Rosiandana',
                    style: CustomTextStyle.body1Medium
                        .copyWith(color: CustomColor.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
