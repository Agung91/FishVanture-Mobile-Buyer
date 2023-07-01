import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 276,
            child: Stack(
              children: [
                Image.asset('assets/bg_profile.png'),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 59,
                        backgroundColor: CustomColor.grey,
                        backgroundImage:
                            AssetImage('assets/default_profile.png'),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Joko Purnomo',
                        style: CustomTextStyle.body1Medium.copyWith(
                          color: CustomColor.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'JokoPurnomo@gmail.com',
                        style: CustomTextStyle.body2Regular.copyWith(
                          color: CustomColor.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
