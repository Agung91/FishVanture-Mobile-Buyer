import 'package:app/common/custom/empty_data.dart';
import 'package:app/config/colors.dart';
import 'package:app/config/text_style.dart';
import 'package:app/modules/home/widget/corousel.dart';
import 'package:app/modules/home/widget/w_card.dart';
import 'package:app/modules/pond/bloc/bloc_pond.dart';
import 'package:app/modules/pond/model/model_pond.dart';
import 'package:app/modules/profile/bloc/bloc_profile.dart';
import 'package:app/modules/profile/model/model_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocPond = context.read<PondBloc>();
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: const _AppbarHome(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const HomeCorousel(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Panen terdekat',
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextStyle.body2SemiBold.copyWith(
                          color: CustomColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              height: 208,
              child: StreamBuilder<List<PondModel>>(
                  stream: blocPond.listPond.stream,
                  initialData: blocPond.listPond.value,
                  builder: (context, snapshot) {
                    final listData = snapshot.data;
                    if (listData == null || listData.isEmpty) {
                      return EmptyData(
                        label: 'Belum ada panen terdekat',
                        onRefresh: () => blocPond.getPonds(),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () => blocPond.getPonds(),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        itemBuilder: (context, index) {
                          return WCard(
                            pondModel: listData[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8.0);
                        },
                        itemCount: listData.length,
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lainnya',
                    style: CustomTextStyle.body2SemiBold,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Lihat Semua',
                        style: CustomTextStyle.body2SemiBold.copyWith(
                          color: CustomColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              height: 208,
              child: StreamBuilder<List<PondModel>>(
                  stream: blocPond.listPond.stream,
                  initialData: blocPond.listPond.value,
                  builder: (context, snapshot) {
                    final listData = snapshot.data;
                    if (listData == null || listData.isEmpty) {
                      return EmptyData(
                        label: 'Belum ada panen terdekat',
                        onRefresh: () => blocPond.getPonds(),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () => blocPond.getPonds(),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        itemBuilder: (context, index) {
                          return WCard(
                            pondModel: listData[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8.0);
                        },
                        itemCount: listData.length,
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHome({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 101);

  @override
  Widget build(BuildContext context) {
    final blocProfile = context.read<ProfileBloc>();
    return Container(
      height: 101,
      color: CustomColors.primary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              // Icon(IconlyLight.arrow_left),
              const CircleAvatar(
                radius: 20,
                backgroundColor: CustomColors.grey,
                backgroundImage: AssetImage('assets/default_profile.png'),
              ),
              const SizedBox(width: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: CustomTextStyle.body3Regular
                        .copyWith(color: CustomColors.white),
                  ),
                  const SizedBox(height: 2.0),
                  StreamBuilder<ProfileModel?>(
                      stream: blocProfile.profile.stream,
                      initialData: blocProfile.profile.value,
                      builder: (context, snapshot) {
                        final data = snapshot.data;
                        if (data == null) {
                          return Text(
                            '-',
                            style: CustomTextStyle.body1Medium
                                .copyWith(color: CustomColors.white),
                          );
                        }
                        return Text(
                          data.name ?? '-',
                          style: CustomTextStyle.body1Medium
                              .copyWith(color: CustomColors.white),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
