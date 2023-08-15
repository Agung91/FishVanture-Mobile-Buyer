import 'package:app/common/custom/empty_data.dart';
import 'package:app/common/widgets/appbar_home.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/budidaya/bloc/bloc_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/pond/bloc/bloc_pond.dart';
import 'package:app/modules/pond/model/model_pond.dart';
import 'package:flutter/material.dart';

import 'package:app/config/colors.dart';
import 'package:app/modules/home/widget/w_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sstream/sstream.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocPond = context.read<PondBloc>();
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: const CustomAppbarHome(appbarText: 'Jadwal Panen'),
      body: StreamBuilder<List<PondModel>>(
          stream: blocPond.listPond.stream,
          initialData: blocPond.listPond.value,
          builder: (context, snapshot) {
            final listData = snapshot.data;
            if (listData == null || listData.isEmpty) {
              return EmptyData(
                label: 'Belum ada panen terdekat',
                onRefresh: () => blocPond.getPonds(),
              );
            }
            return RefreshIndicator(
              onRefresh: () => blocPond.getPonds(),
              child: MasonryGridView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                // controller: _controller,
                padding: const EdgeInsets.all(8),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return WCard(
                    pondModel: listData[index],
                  );
                },
                // itemCount: listData.length,
                itemCount: 11,
              ),
            );
          }),
      // body: GridView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 4 / 5,
      //     crossAxisSpacing: 8,
      //     mainAxisSpacing: 8,
      //   ),
      //   itemBuilder: (context, index) {
      //     return const WCard();
      //   },
      //   itemCount: 12,
      // ),
    );
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
