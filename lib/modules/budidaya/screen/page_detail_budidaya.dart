import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/common/widgets/appbar.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';

class DetailBudidayaPage extends StatelessWidget {
  const DetailBudidayaPage({
    Key? key,
    required this.budidaya,
  }) : super(key: key);

  final BudidayaModel budidaya;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: const CustomAppbar(appbarText: 'Detail Budidaya'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _WImage(budidaya: budidaya),
            const SizedBox(height: 12),
            _WName(budidayaModel: budidaya),
            // const SizedBox(height: 12),
            // _WAddress(pondModel: budidaya),
            const SizedBox(height: 16),
            // if (budidaya.status == StatusSubmission.submission ||
            //     budidaya.status == StatusSubmission.reviewed)
            _WActionButton(),
          ],
        ),
      ),
    );
  }
}

class _WActionButton extends StatelessWidget {
  const _WActionButton({
    Key? key,
    // required this.pondModel,
  }) : super(key: key);

  // final PondModel pondModel;

  @override
  Widget build(BuildContext context) {
    // final blocPond = context.read<PondBloc>();
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

// class _WAddress extends StatelessWidget {
//   const _WAddress({
//     Key? key,
//     required this.pondModel,
//   }) : super(key: key);

//   final PondModel pondModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 24),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 12,
//       ),
//       decoration: BoxDecoration(
//         color: CustomColors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Alamat',
//                   style: CustomTextStyle.body1Medium,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   '${pondModel.noteAddress} || ${pondModel.detailAddress}, ${pondModel.district.name}, Kec.${pondModel.city.name}, ${pondModel.province.name} - ${pondModel.country.name} ',
//                   style: CustomTextStyle.body2Regular,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 4),
//           TextButton.icon(
//             style: ButtonStyle(
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18.0),
//                 side: const BorderSide(
//                   color: CustomColors.primary,
//                 ),
//               ),
//             )),
//             onPressed: () => launchInBrowser(pondModel.url),
//             // onPressed: () => context.read<PondBloc>().getPonds(),
//             label: Text(
//               'Lokasi',
//               style: CustomTextStyle.body1Medium
//                   .copyWith(color: CustomColors.primary),
//             ),
//             icon: const Icon(
//               IconlyBold.location,
//               size: 18,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _WName extends StatelessWidget {
  const _WName({
    super.key,
    required this.budidayaModel,
  });

  final BudidayaModel budidayaModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              budidayaModel.fishSpecies.name.toUpperCase(),
              style: CustomTextStyle.body1Medium,
            ),
          ),
          Text(
            budidayaModel.status.toUpperCase(),
            style: CustomTextStyle.body2Medium.copyWith(
              color: CustomColors.grey,
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
    required this.budidaya,
  });

  final BudidayaModel budidaya;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/load_img.png'),
            image: CachedNetworkImageProvider(budidaya.pool.image),
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
      ),
    );
  }
}
