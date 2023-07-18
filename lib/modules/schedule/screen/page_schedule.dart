import 'package:app/common/widgets/appbar.dart';
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
        ));
    // body: GridView.custom(
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //     mainAxisExtent: 100,
    //     // childAspectRatio: 4 / 5,
    //     crossAxisSpacing: 8,
    //     mainAxisSpacing: 8,
    //     maxCrossAxisExtent: 100,
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //       childCount: 34,
    //       (context, index) => Container(
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 fit: BoxFit.cover,
    //                 image: NetworkImage(
    //                     'https://picsum.photos/200/300?random=$index'),
    //               ),
    //             ),
    //           )),
    // ));
  }
}
