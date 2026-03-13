import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/build_your_cake_state.dart';

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  late final BuildYourCakeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BuildYourCakeCubit>();
  }



  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF1E6091),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<BuildYourCakeCubit, BuildYourCakeState>(
          buildWhen: (previous, current) =>
              current is BuildYourCakeChangeFeatureState,
          builder: (context, state) {
            return ListView.separated(
              itemCount: cubit.features.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 10),
              itemBuilder: (context, index) {
                final feature = cubit.features[index];
                return GestureDetector(
                  onTap: () {
                    context.read<BuildYourCakeCubit>().changeFeature(
                      index,
                    );
                  },
                  child: _buildFeature(
                    index,
                    feature['title'],
                    feature['icon'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeature(int index, String title, IconData icon) {
    final isSelected = index == cubit.step;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? Colors.white.withValues(alpha: 0.2)
            : Colors.transparent,
      ),
      child: Column(
        spacing: 5,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
