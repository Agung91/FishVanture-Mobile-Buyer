import 'package:app/common/custom/empty_data.dart';
import 'package:app/common/custom/format_number.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/modules/orders/model/order_status.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:app/common/widgets/appbar_home.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/orders/bloc/bloc_order.dart';
import 'package:app/modules/orders/model/model_order.dart';
import 'package:app/modules/schedule/screen/page_schedule.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.background,
        appBar: const CustomAppbarHome(appbarText: 'Pesanan'),
        body: Column(
          children: [
            Container(
              color: CustomColors.white,
              child: const TabBar(
                labelPadding: EdgeInsets.all(12),
                unselectedLabelColor: CustomColors.fadedGrey,
                labelColor: CustomColors.primary,
                tabs: [
                  Text('Berlangsung'),
                  Text('Selesai'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                _OrderActive(),
                _OrderComplete(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderActive extends StatelessWidget {
  const _OrderActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocOrder = context.read<OrderBloc>();
    return StreamBuilder<List<OrderModel>>(
        stream: blocOrder.orderActive.stream,
        initialData: blocOrder.orderActive.value,
        builder: (context, snapshot) {
          final listData = snapshot.data;
          if (listData == null || listData.isEmpty) {
            return EmptyData(
              onRefresh: () async => await blocOrder.order(),
              label: 'Belum ada pesanan terbaru',
            );
          }
          return RefreshIndicator(
            onRefresh: () async => await blocOrder.order(),
            child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemBuilder: (context, index) {
                  return _ItemOrder(
                    orderModel: listData[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8.0);
                },
                itemCount: listData.length),
          );
        });
  }
}

class _OrderComplete extends StatelessWidget {
  const _OrderComplete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocOrder = context.read<OrderBloc>();
    return StreamBuilder<List<OrderModel>>(
        stream: blocOrder.orderComplete.stream,
        initialData: blocOrder.orderComplete.value,
        builder: (context, snapshot) {
          final listData = snapshot.data;
          if (listData == null || listData.isEmpty) {
            return EmptyData(
              onRefresh: () async => await blocOrder.order(),
              label: 'Belum ada pesanan yang selesai diproses',
            );
          }
          return RefreshIndicator(
            onRefresh: () async => await blocOrder.order(),
            child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemBuilder: (context, index) {
                  return _ItemOrder(
                    orderModel: listData[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8.0);
                },
                itemCount: listData.length),
          );
        });
  }
}

class _ItemOrder extends StatelessWidget {
  const _ItemOrder({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    final blocOrder = context.read<OrderBloc>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: CustomColors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // 'DRM00000123',
                orderModel.code,
                style: CustomTextStyle.body2Medium.copyWith(
                  color: CustomColors.grey,
                ),
              ),
              Text(
                // '17 November 2022 - 16:47 WIB',
                DateFormat('EEEE, dd MMMM yyyy', 'id')
                    // .format(orderModel.createdAt),
                    .format(orderModel.bookingDate),
                style: CustomTextStyle.body3Regular.copyWith(
                  color: CustomColors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: OrderStatus.statusFadedColor(orderModel.status),
                ),
                child: Text(
                  OrderStatus.statusInfo(orderModel.status),
                  style: CustomTextStyle.body3Regular.copyWith(
                    color: OrderStatus.statusColor(orderModel.status),
                  ),
                )),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage(
                  height: 60,
                  width: 80,
                  placeholder: const AssetImage('assets/load_img.png'),
                  image: CachedNetworkImageProvider(
                      orderModel.budidaya.pool.image),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderModel.budidaya.fishSpecies.name.toUpperCase(),
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    // '20 kg',
                    '${orderModel.qty} kg',
                    style: CustomTextStyle.body2Regular.copyWith(
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         DateFormat('EEEE, dd MMMM yyyy', 'id')
          //             .format(orderModel.bookingDate),
          //         style: CustomTextStyle.body2Regular,
          //       ),
          //     ),
          // Expanded(
          // child:
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              orderModel.ammout.toIdr(),
              style: CustomTextStyle.body1SemiBold,
            ),
          ),
          // ),
          //   ],
          // ),
          const SizedBox(height: 12),
          if (orderModel.status == OrderStatus.active) ...[
            CustomButton(
              borderColor: CustomColors.error,
              textColor: CustomColors.error,
              isPrimary: false,
              textButton: 'Batalkan',
              onTap: () async {
                // TODO diberi alert dialog
                await blocOrder.cancelOrder(orderModel.id);
                blocOrder.order();
              },
            )
          ]
        ],
      ),
    );
  }
}
