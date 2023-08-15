// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
// import 'package:app/common/custom/empty_data.dart';
// import 'package:app/common/widgets/appbar_home.dart';
// import 'package:app/config/colors.dart';
// import 'package:app/modules/budidaya/bloc/bloc_budidaya.dart';
// import 'package:app/modules/budidaya/model/model_budidaya.dart';
// import 'package:app/modules/budidaya/widget/w_budidaya_card.dart';

// class BudidayaPage extends StatelessWidget {
//   const BudidayaPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final blocBudidaya = context.read<BudidayaBloc>();
//     return Scaffold(
//       backgroundColor: CustomColors.background,
//       appBar: const CustomAppbarHome(
//         appbarText: 'Budidaya',
//       ),
//       body: StreamBuilder<List<BudidayaModel>>(
//           stream: blocBudidaya.listBudidaya.stream,
//           initialData: blocBudidaya.listBudidaya.value,
//           builder: (context, snapshot) {
//             final listData = snapshot.data;
//             if (listData == null || listData.isEmpty) {
//               return EmptyData(
//                 label: 'Belum ada budidaya',
//                 onRefresh: () => blocBudidaya.getListBudidaya(),
//               );
//             }
//             return RefreshIndicator(
//               onRefresh: () => blocBudidaya.getListBudidaya(),
//               child: MasonryGridView.builder(
//                 physics: const AlwaysScrollableScrollPhysics(
//                     parent: BouncingScrollPhysics()),
//                 // controller: _controller,
//                 padding: const EdgeInsets.all(8),
//                 gridDelegate:
//                     const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 itemBuilder: (context, index) {
//                   return WBudidayaCard(
//                     budidayaModel: listData[index],
//                   );
//                 },
//                 itemCount: listData.length,
//               ),
//             );
//           }),
//     );
//   }
// }
