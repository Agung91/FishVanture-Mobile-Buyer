import 'package:app/common/custom/snackbar/snackbar_popup.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'package:app/common/custom/format_number.dart';
import 'package:app/common/custom/custom_date_picker.dart';
import 'package:app/common/widgets/appbar.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/config/colors.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/orders/bloc/bloc_order.dart';

class OrderProcessPage extends StatelessWidget {
  const OrderProcessPage({
    Key? key,
    required this.budidayaModel,
  }) : super(key: key);

  final BudidayaModel budidayaModel;

  @override
  Widget build(BuildContext context) {
    final blocOrder = context.read<OrderBloc>();
    if (budidayaModel.priceList != null) {
      blocOrder.price.add(budidayaModel.priceList!.first.price);
    }
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: CustomAppbar(
        appbarText: 'Detail Pesanan',
        onBack: () => blocOrder.makeEmpty(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Catatan:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                    'Harga akan mengalami perubahan seiring dengan jumlah pembelian yang Anda lakukan.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage(
                    height: 60,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/load_img.png'),
                    image: CachedNetworkImageProvider(
                        budidayaModel.pool?.image ?? ''),
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
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          budidayaModel.fishSpecies.name.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              blocOrder.decrement();
                              blocOrder.updatePrice(budidayaModel.priceList);
                              blocOrder.calculatePrice();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: CustomColors.secondary,
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                                color: CustomColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          StreamBuilder<int>(
                              stream: blocOrder.quantity.stream,
                              initialData: blocOrder.quantity.value,
                              builder: (context, snapshot) {
                                return Text(
                                  '${snapshot.data}',
                                );
                              }),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              blocOrder.increment();
                              blocOrder.updatePrice(budidayaModel.priceList);
                              blocOrder.calculatePrice();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: CustomColors.secondary,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: CustomColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: StreamBuilder<int>(
                            stream: blocOrder.price.stream,
                            initialData: blocOrder.price.value,
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data?.toIdr() ?? 0.toIdr(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tanggal Pemesanan',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text(
                  // 'Tanggal yang akan Anda tentukan adalah tanggal ketika Anda akan melakukan pemesanan ',
                  'Tanggal yang akan ditentukan akan menjadi tanggal pengambilan pesanan Anda',
                ),
                DatePicker(
                    helpText: 'PILIH TANGGAL PEMESANAN',
                    label: '',
                    hintText: 'Pilih Tanggal Pemesanan',
                    sStream: blocOrder.bookDate)
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rincian Pesanan',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Total Pesanan'),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: StreamBuilder<int>(
                            stream: blocOrder.amount.stream,
                            initialData: blocOrder.amount.value,
                            builder: (context, snapshot) {
                              return Text(snapshot.data?.toIdr() ?? 0.toIdr());
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: CustomColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(color: CustomColors.grey),
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: StreamBuilder<int>(
                        stream: blocOrder.amount.stream,
                        initialData: blocOrder.amount.value,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data?.toIdr() ?? 0.toIdr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: CustomButton(
                textButton: 'Buat Pesanan',
                onTap: () async {
                  await blocOrder.createOrder(budidayaModel.id);
                  snacBarPopUp(
                    message: 'Berhasil membuat pesanan',
                    color: CustomColors.green,
                    icon: IconlyLight.tick_square,
                  );
                  RouteBloc().pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
