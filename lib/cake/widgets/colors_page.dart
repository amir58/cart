import 'package:cart/cake/cubit/build_your_cake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({super.key});

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  late final BuildYourCakeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BuildYourCakeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: 7,
        itemBuilder: (context, index) {
          final colors = [
            Colors.transparent,
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.purple,
            Colors.orange,
          ];

          return GestureDetector(
            onTap: () {
              cubit.changeColor(colors[index]);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors[index],
                // borderRadius: BorderRadius.circular(12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
