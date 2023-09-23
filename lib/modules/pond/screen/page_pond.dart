import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'package:app/common/custom/launch_url.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/core/route/bloc_route.dart';
import 'package:app/modules/budidaya/bloc/bloc_budidaya.dart';
import 'package:app/modules/budidaya/model/model_budidaya.dart';
import 'package:app/modules/budidaya/widget/w_budidaya_card.dart';
import 'package:app/modules/pond/bloc/bloc_pond.dart';
import 'package:app/modules/pond/model/model_pond.dart';

// MEMBUAT BUDIDAYA BARU DARI SELLER, KARENA DATANYA BANYAK YANG NGAWUR WKWK

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
        onRefresh: () async => await blocBudidaya.getListBudidaya(pondModel.id),
        child: SingleChildScrollView(
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
                _WBudidaya(pondName: pondModel.name),
                const SizedBox(height: 16),
                // _WActionButton(pondModel: pondModel),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: CustomColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: CustomButton(
          textButton: 'Hubungi Penjual',
          onTap: () async {},
        ),
      ),
    );
  }
}

class _WBudidaya extends StatelessWidget {
  const _WBudidaya({
    Key? key,
    required this.pondName,
  }) : super(key: key);

  final String pondName;

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
                    return const Center(
                      child: Text(
                        'Belum ada budidaya',
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return WBudidayaCard(
                        pondName:pondName,
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
                '${pondModel.noteAddress} || ${pondModel.detailAddress}, Kecamatan ${pondModel.district.name}, ${pondModel.city.name}, ${pondModel.province.name} - ${pondModel.country.name} ',
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
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  pondModel.name.toUpperCase(),
                  style: CustomTextStyle.heading5Medium,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
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
    final blocBudidaya = context.read<BudidayaBloc>();
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
        _BackButton(
          onBack: () => blocBudidaya.makeEmpty(),
        )
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
    this.onBack,
  }) : super(key: key);
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 24,
      child: InkWell(
        onTap: () {
          if (onBack != null) {
            onBack!();
          }
          RouteBloc().pop();
        },
        child: SizedBox(
          height: 40,
          width: 40,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            child: const Icon(
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
