import 'package:app/common/custom/snackbar/snackbar_popup.dart';
import 'package:app/common/widgets/appbar.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:app/modules/budidaya/bloc/bloc_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/widget/w_budidaya_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'package:app/common/custom/launch_url.dart';
import 'package:app/common/model/model_status.dart';
import 'package:app/common/widgets/appbar_home.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/pond/bloc/bloc_pond.dart';
import 'package:app/modules/pond/model/model_pond.dart';

class PondPage extends StatelessWidget {
  const PondPage({
    Key? key,
    required this.pondModel,
  }) : super(key: key);

  final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    final blocBudidaya = context.read<BudidayaBloc>();
    blocBudidaya.getListBudidaya(pondModel.id);
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: RefreshIndicator(
        onRefresh: () => blocBudidaya.getListBudidaya(pondModel.id),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WImage(pondModel: pondModel),
                const SizedBox(height: 12),
                _WName(pondModel: pondModel),
                const SizedBox(height: 24),
                _WAddress(pondModel: pondModel),
                const SizedBox(height: 24),
                _WBudidaya(),
                const SizedBox(height: 16),
                _WActionButton(pondModel: pondModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WActionButton extends StatelessWidget {
  const _WActionButton({
    Key? key,
    required this.pondModel,
  }) : super(key: key);

  final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    final blocPond = context.read<PondBloc>();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: CustomColors.red),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // blocPond.updatePondDisabled(pondModel.id).then((value) =>
                    //     snacBarPopUp(context,
                    //         color: CustomColors.green,
                    //         icon: IconlyBold.tick_square,
                    //         text: 'Berhasil menolak budidaya'));
                    // RouteBloc().pop();
                  },
                  child: Text(
                    'Tolak',
                    style: CustomTextStyle.body2Medium
                        .copyWith(color: CustomColors.red),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: CustomColors.primary),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // blocPond.updatePondActived(pondModel.id).then((value) =>
                    //     snacBarPopUp(context,
                    //         color: CustomColors.green,
                    //         icon: IconlyBold.tick_square,
                    //         text: 'Berhasil mengaktifkan budidaya'));
                    // RouteBloc().pop();
                  },
                  child: Text(
                    'Terima',
                    style: CustomTextStyle.body2Medium
                        .copyWith(color: CustomColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _WBudidaya extends StatelessWidget {
  const _WBudidaya({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocBudidaya = context.read<BudidayaBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Budidaya',
            style: CustomTextStyle.body1Medium,
          ),
          SizedBox(
            height: 236,
            child: StreamBuilder<List<BudidayaModel>>(
                stream: blocBudidaya.listBudidaya.stream,
                initialData: blocBudidaya.listBudidaya.value,
                builder: (context, snapshot) {
                  final listData = snapshot.data;
                  if (listData == null || listData.isEmpty) {
                    return Center(
                      child: Text(
                        'Belum ada budidaya',
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return WBudidayaCard(
                        budidaya: listData[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    itemCount: listData.length,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _WAddress extends StatelessWidget {
  const _WAddress({
    Key? key,
    required this.pondModel,
  }) : super(key: key);

  final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: () => launchInBrowser(pondModel.url),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              IconlyLight.location,
              size: 24,
              color: CustomColors.primary,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${pondModel.noteAddress} || ${pondModel.detailAddress}, Kecamatan ${pondModel.district.name}, ${pondModel.city.name}, ${pondModel.province.name} - ${pondModel.country.name} '
                    .toUpperCase(),
                style: CustomTextStyle.body1Regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WName extends StatelessWidget {
  const _WName({
    super.key,
    required this.pondModel,
  });

  final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              pondModel.name.toUpperCase(),
              style: CustomTextStyle.heading5Medium,
            ),
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: CustomColors.grey,
            backgroundImage: AssetImage(
              'assets/default_profile.png',
            ),
          ),
        ],
      ),
    );
  }
}

class _WImage extends StatelessWidget {
  const _WImage({
    super.key,
    required this.pondModel,
  });

  final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/load_img.png'),
            image: CachedNetworkImageProvider(pondModel.image),
            imageErrorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 60,
                width: 100,
                child: Icon(
                  IconlyBold.info_square,
                  color: CustomColors.red,
                  size: 60,
                ),
              );
            },
          ),
        ),
        _BackButton()
      ],
    );
  }
}

// class _WBudidayaCard extends StatelessWidget {
//   const _WBudidayaCard({
//     Key? key,
//     required this.budidaya,
//   }) : super(key: key);

//   final BudidayaModel budidaya;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       // height: 120,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         color: CustomColors.white,
//         boxShadow: const [
//           BoxShadow(
//               blurRadius: 8,
//               color: CustomColors.fadedGrey,
//               offset: Offset(2, 2)),
//         ],
//       ),
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: FadeInImage(
//               height: 120,
//               width: 200,
//               fit: BoxFit.cover,
//               placeholder: const AssetImage('assets/load_img.png'),
//               image: CachedNetworkImageProvider(budidaya.pool.image),
//             ),
//           ),
//           const SizedBox(height: 12.0),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   budidaya.pool.name,
//                   style: CustomTextStyle.body2SemiBold,
//                 ),
//                 const SizedBox(height: 6),
//                 FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                     '${budidaya.pool.long}m x ${budidaya.pool.wide}m',
//                     style: CustomTextStyle.body2Medium,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _BackButton extends StatelessWidget {
  const _BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 24,
      child: InkWell(
        onTap: () {
          RouteBloc().pop();
        },
        child: SizedBox(
          height: 40,
          width: 40,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
            child: Icon(
              IconlyLight.arrow_left_2,
              size: 24,
              color: CustomColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
