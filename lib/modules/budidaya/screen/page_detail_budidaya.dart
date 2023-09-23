import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:app/common/custom/format_number.dart';
import 'package:app/common/model/model_status.dart';
import 'package:app/common/widgets/appbar.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';

class DetailBudidayaPage extends StatelessWidget {
  const DetailBudidayaPage({
    Key? key,
    required this.budidayaModel,
    required this.pondName,
  }) : super(key: key);

  final BudidayaModel budidayaModel;
  final String pondName;

  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    final price = budidayaModel.priceList;
    price?.sort(
      (a, b) => a.limit - b.limit,
    );
    final waktuPanen = _daysBetween(
        budidayaModel.dateOfSeed, budidayaModel.estPanenDate ?? DateTime.now());
    final umur = _daysBetween(budidayaModel.dateOfSeed, DateTime.now());
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: const CustomAppbar(appbarText: 'Detail Budidaya'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _WImage(budidaya: budidayaModel),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CustomColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.profile,
                        color: CustomColors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        pondName.toUpperCase(),
                        style: CustomTextStyle.body2Medium.copyWith(
                          color: CustomColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    budidayaModel.fishSpecies.name.toUpperCase(),
                    style: CustomTextStyle.heading5SemiBold,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Ukuran ${budidayaModel.pool.long.toInt()}m x ${budidayaModel.pool.wide.toInt()}m',
                              style: CustomTextStyle.body2Medium.copyWith(
                                color: CustomColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 1,
                        height: 18,
                        color: CustomColors.fadedGrey,
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Umur $umur hari',
                              style: CustomTextStyle.body2Medium.copyWith(
                                color: CustomColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 1,
                        height: 18,
                        color: CustomColors.fadedGrey,
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Stok ${budidayaModel.estTonase?.toInt()}kg',
                              style: CustomTextStyle.body2Medium.copyWith(
                                color: CustomColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.calendar_1,
                        color: CustomColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('EEEE, dd MMMM yyyy', 'id')
                            .format(budidayaModel.dateOfSeed),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.time_circle,
                        color: CustomColors.primary,
                      ),
                      const SizedBox(width: 4),
                      if (budidayaModel.estPanenDate != null) ...[
                        Text('$waktuPanen Hari'),
                      ] else ...[
                        const Text('-'),
                      ]
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        price?.first.price.toIdr() ?? '-',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.primary,
                        ),
                      ),
                      const Text('/Kg'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: CustomColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: CustomButton(
          textButton: 'Pesan Sekarang',
          onTap: () async {
            RouteBloc().push(RouteOrderProcess(budidayaModel));
          },
        ),
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
