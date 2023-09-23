import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/pond/model/model_pond.dart';

class WCard extends StatelessWidget {
  const WCard({
    Key? key,
    required this.pondModel,
  }) : super(key: key);

  final PondModel pondModel;

  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouteBloc().push(RoutePond(pondModel)),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: 168,
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
                  placeholder: AssetImage('assets/load_img.png'),
                  image: CachedNetworkImageProvider(pondModel.image),
                ),
              ),
            ),
            SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                pondModel.name.toUpperCase(),
                style: CustomTextStyle.body2SemiBold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Desa ${pondModel.district.name}, Kec. ${pondModel.district.name} - ${pondModel.city.name}',
              style: CustomTextStyle.body3Regular.copyWith(
                color: CustomColors.grey,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  IconlyBold.time_circle,
                  size: 16,
                  color: CustomColors.primary,
                ),
                SizedBox(width: 4),
                Text(
                  // '123 Hari',
                  '',
                  style: CustomTextStyle.body2Medium.copyWith(
                    color: CustomColors.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
