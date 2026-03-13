import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:cart/cake/cubit/build_your_cake_state.dart';
import 'package:cart/cake/widgets/colors_page.dart';
import 'package:cart/cake/widgets/flavors_page.dart';
import 'package:cart/cake/widgets/shape_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<BuildYourCakeCubit, BuildYourCakeState>(
        listener: (context, state) {
          if (state is BuildYourCakeChangeFeatureState) {
            controller.animateToPage(
              state.index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },

        buildWhen: (previous, current) =>
            current is BuildYourCakeChangeFeatureState,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(25),
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [ShapePage(), FlavorsPage(), ColorsPage()],
            ),
          );
        },
      ),
    );
  }
}
