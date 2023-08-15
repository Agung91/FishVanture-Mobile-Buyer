import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarHome({
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
      color: CustomColors.primary,
      height: 88,
      child: SafeArea(
        child: Center(
          child: Text(
            appbarText,
            style: CustomTextStyle.body1Medium.copyWith(
              color: CustomColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
