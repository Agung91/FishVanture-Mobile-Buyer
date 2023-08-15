import 'package:app/common/widgets/appbar_home.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/schedule/screen/page_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.background,
        appBar: CustomAppbarHome(appbarText: 'Pesanan'),
        body: Column(
          children: [
            Container(
              color: CustomColors.white,
              // height: 42,
              // padding: EdgeInsets.all(12),
              child: TabBar(
                labelPadding: EdgeInsets.all(12),
                unselectedLabelColor: CustomColors.fadedGrey,
                labelColor: CustomColors.primary,
                tabs: [
                  Text('Berlangsung'),
                  Text('Selesai'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                OrderActive(),
                Center(child: Text('Selesai')),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class OrderActive extends StatelessWidget {
  const OrderActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 12),
        itemBuilder: (context, index) {
          return ItemOrder();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: 4);
  }
}

class ItemOrder extends StatelessWidget {
  const ItemOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: CustomColors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DRM00000123',
                style: CustomTextStyle.body2Medium.copyWith(
                  color: CustomColors.grey,
                ),
              ),
              Text(
                '17 November 2022 - 16:47 WIB',
                style: CustomTextStyle.body3Regular.copyWith(
                  color: CustomColors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Sedang Proses',
                  style: CustomTextStyle.body3Regular.copyWith(
                    color: CustomColors.primary,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: CustomColors.fadedBlue,
                )),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage(
                  height: 60,
                  width: 80,
                  placeholder: AssetImage('assets/load_img.png'),
                  image: AssetImage('assets/ikan.png'),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ikan Lele',
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '20 kg',
                    style: CustomTextStyle.body2Regular.copyWith(
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Rp 2.600.000',
                style: CustomTextStyle.body1SemiBold,
              ))
        ],
      ),
    );
  }
}
