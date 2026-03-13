import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:cart/cake/data/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShapePage extends StatefulWidget {
  const ShapePage({super.key});

  @override
  State<ShapePage> createState() => _ShapePageState();
}

class _ShapePageState extends State<ShapePage> {
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
      itemCount: shapes.length,

      itemBuilder: (context, index) {
        final shape = shapes[index];

        return GestureDetector(
          onTap: () {
            cubit.changeShape(shape.id);
            setState(() {});
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: shape.image,
                      ),
                    ),
                    Text(
                      shape.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                if (cubit.shapeId == shape.id)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E6091).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
