import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app/common/widgets/appbar_home.dart';
import 'package:app/config/colors.dart';

class DetailBudidayaPage extends StatelessWidget {
  const DetailBudidayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: CustomAppbarHome(appbarText: 'Detail Budidaya'),
    );
  }
}
