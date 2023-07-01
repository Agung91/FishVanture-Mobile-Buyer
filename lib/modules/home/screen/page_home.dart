import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/home/widget/corousel.dart';
import 'package:app/modules/home/widget/w_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      appBar: _AppbarHome(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 24),
            HomeCorousel(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Panen terdekat',
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextStyle.body2SemiBold.copyWith(
                          color: CustomColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              height: 208,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (context, index) {
                  return WCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8.0);
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lainnya',
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextStyle.body2SemiBold.copyWith(
                          color: CustomColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              height: 208,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (context, index) {
                  return WCard();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8.0);
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
                  const SizedBox(height: 2.0),
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
