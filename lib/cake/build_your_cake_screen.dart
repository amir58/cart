import 'package:cart/cake/cake_image.dart';
import 'package:cart/cake/content.dart';
import 'package:cart/cake/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/build_your_cake_cubit.dart';

class BuildYourCakeScreen extends StatefulWidget {
  const BuildYourCakeScreen({super.key});

  @override
  State<BuildYourCakeScreen> createState() =>
      _BuildYourCakeScreenState();
}

class _BuildYourCakeScreenState extends State<BuildYourCakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CakeImage(),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Features(),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Content(),
                        SafeArea(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<BuildYourCakeCubit>()
                                    .nextStep();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1E6091),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  'التالي',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
