import 'dart:ui';

import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/home/screen/page_home.dart';
import 'package:app/modules/orders/screen/page_order.dart';
import 'package:app/modules/profile/screen/page_profile.dart';
import 'package:app/modules/schedule/screen/page_schedule.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

final screens = [
  const HomePage(),
  const SchedulePage(),
  const OrderPage(),
  const ProfilePage(),
];

int selectedIndex = 0;

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        color: CustomColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: CustomColors.white,
          currentIndex: selectedIndex,
          unselectedItemColor: CustomColors.fadedGrey,
          selectedLabelStyle: CustomTextStyle.body2Medium,
          iconSize: 24.0,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,  
                    colors: [
                      CustomColors.primary,
                      CustomColors.white,
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Icon(IconlyBold.home),
              ),
              icon: Icon(IconlyBold.home),
            ),
            BottomNavigationBarItem(
              label: 'Jadwal',
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,
                    colors: [
                      CustomColors.primary,
                      CustomColors.white,
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Icon(IconlyBold.calendar),
              ),
              icon: Icon(IconlyBold.calendar),
            ),
            BottomNavigationBarItem(
              label: 'Pesanan',
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,
                    colors: [
                      CustomColors.primary,
                      CustomColors.white,
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Icon(IconlyBold.bag),
              ),
              icon: Icon(IconlyBold.bag),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              activeIcon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 1,
                    colors: [
                      CustomColors.primary,
                      CustomColors.white,
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Icon(IconlyBold.profile),
              ),
              icon: Icon(IconlyBold.profile),
            ),
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
