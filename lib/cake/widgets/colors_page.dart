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
    final colors = [
      Colors.transparent,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.brown,
      Colors.pink,
      Colors.grey,
      Colors.black,
      Colors.white,
      Colors.blueGrey,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.deepPurpleAccent,
      Colors.deepOrangeAccent,
    ];

    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
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
