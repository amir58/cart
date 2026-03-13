import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:cart/cake/data/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlavorsPage extends StatefulWidget {
  const FlavorsPage({super.key});

  @override
  State<FlavorsPage> createState() => _FlavorsPageState();
}

class _FlavorsPageState extends State<FlavorsPage> {
  late final BuildYourCakeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BuildYourCakeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: flavors.length,

      itemBuilder: (context, index) {
        final flavor = flavors[index];

        return GestureDetector(
          onTap: () {
            cubit.changeFlavor(flavor.id);
            setState(() {});
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(imageUrl: flavor.image),
              ),
              if (cubit.flavorId == flavor.id)
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E6091).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
