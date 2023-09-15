import 'package:app/common/custom/format_number.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';

class WBudidayaCard extends StatelessWidget {
  const WBudidayaCard({
    Key? key,
    required this.budidaya,
  }) : super(key: key);

  final BudidayaModel budidaya;

  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    final price = (budidaya.priceList?.first.price != null)
        ? budidaya.priceList?.first.price?.toIdr()
        : '-';
    final waktuPanen = _daysBetween(
        budidaya.dateOfSeed, budidaya.estPanenDate ?? DateTime.now());
    return GestureDetector(
      onTap: () => RouteBloc().push(RouteDetailBudidaya(budidaya)),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: CustomColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: FadeInImage(
                  height: 118,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/load_img.png'),
                  image: CachedNetworkImageProvider(budidaya.pool.image),
                ),
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                budidaya.pool.name.toUpperCase(),
                style: CustomTextStyle.body2SemiBold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price ?? '',
              style: CustomTextStyle.body3Regular.copyWith(
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  budidaya.status.toUpperCase(),
                  style: CustomTextStyle.body2Medium.copyWith(
                    color: CustomColors.grey,
                  ),
                ),
                const Spacer(),
                if (budidaya.estPanenDate != null && waktuPanen >= 0) ...[
                  const Icon(
                    IconlyBold.time_circle,
                    size: 16,
                    color: CustomColors.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$waktuPanen Hari',
                    style: CustomTextStyle.body2Medium.copyWith(
                      color: CustomColors.primary,
                    ),
                  ),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
