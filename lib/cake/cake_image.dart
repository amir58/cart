import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:cart/cake/cubit/build_your_cake_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CakeImage extends StatefulWidget {
  const CakeImage({super.key});

  @override
  State<CakeImage> createState() => _CakeImageState();
}

class _CakeImageState extends State<CakeImage> {
  late final BuildYourCakeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BuildYourCakeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildYourCakeCubit, BuildYourCakeState>(
      buildWhen: (previous, current) =>
          current is BuildYourCakeImageState ||
          current is BuildYourCakeChangeColorState,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          // padding: const EdgeInsets.all(25),
          child: cubit.cakeColor != null
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    cubit.cakeColor!,
                    BlendMode.hue,
                  ),
                  child: CachedNetworkImage(imageUrl: cubit.imageUrl),
                )
              : CachedNetworkImage(imageUrl: cubit.imageUrl),
        );
      },
    );
  }
}
