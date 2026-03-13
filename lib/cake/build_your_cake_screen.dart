import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/cake/widgets/colors_page.dart';
import 'package:cart/cake/widgets/flavors_page.dart';
import 'package:cart/cake/widgets/shape_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/build_your_cake_cubit.dart';
import 'cubit/build_your_cake_state.dart';
import 'data/shapes.dart';

class BuildYourCakeScreen extends StatefulWidget {
  const BuildYourCakeScreen({super.key});

  @override
  State<BuildYourCakeScreen> createState() =>
      _BuildYourCakeScreenState();
}

class _BuildYourCakeScreenState extends State<BuildYourCakeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildYourCakeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('اصنع كعتك'),
          backgroundColor: Colors.white,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            spacing: 10,
            children: [
              Expanded(
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
              ),
              Expanded(
                flex: 4,
                child: Row(children: [Features(), Content()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final List<Map<String, dynamic>> features = [
    {'title': 'الشكل', 'icon': Icons.cake},
    {'title': 'النكهة', 'icon': Icons.icecream},
    {'title': 'اللون', 'icon': Icons.color_lens},
  ];

  int selectedFeatureIndex = 0;

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
        child: ListView.separated(
          itemCount: features.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            final feature = features[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedFeatureIndex = index;
                });
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
        ),
      ),
    );
  }

  Widget _buildFeature(int index, String title, IconData icon) {
    final isSelected = index == selectedFeatureIndex;

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
      flex: 4,
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
