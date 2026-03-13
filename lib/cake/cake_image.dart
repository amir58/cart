import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:cart/cake/cubit/build_your_cake_state.dart';
import 'package:cart/cake/data/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CakeImage extends StatelessWidget {
  const CakeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child:
          BlocBuilder<
            BuildYourCakeCubit,
            BuildYourCakeState
          >(
            buildWhen: (previous, current) =>
                current is BuildYourCakeImageState,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(25),
                child: CachedNetworkImage(
                  imageUrl: state is BuildYourCakeImageState
                      ? state.image
                      : shapes.first.image,
                ),
              );
            },
          ),
    );
  }
}
