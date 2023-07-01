import 'package:app/config/text_style.dart';
import 'package:flutter/material.dart';

import 'package:app/config/colors.dart';
import 'package:app/modules/home/widget/w_card.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: 'Jadwal Panen'),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return const WCard();
        },
        itemCount: 12,
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.appbarText,
  }) : super(key: key);

  final String appbarText;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 88);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.primary,
      height: 88,
      child: SafeArea(
        child: Center(
          child: Text(
            appbarText,
            style: CustomTextStyle.body1Medium.copyWith(
              color: CustomColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
