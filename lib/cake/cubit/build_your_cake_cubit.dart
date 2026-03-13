import 'package:cart/cake/cubit/build_your_cake_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, String> images = {
  'circle': 'https://i.ibb.co/wNXqkMbD/IMG-5764.jpg',
  'circle-redvelvet': 'https://i.ibb.co/fGH2q036/IMG-5769.jpg',
  'circle-pistachio': 'https://i.ibb.co/NdPDpVDy/IMG-5770.jpg',
  'heart': 'https://i.ibb.co/8LgZkHsM/IMG-5765.jpg',
  'heart-redvelvet': 'https://i.ibb.co/x8ds7WQG/IMG-5772.jpg',
  'heart-pistachio': 'https://i.ibb.co/Tq2P2mvb/IMG-5771.jpg',
};

class BuildYourCakeCubit extends Cubit<BuildYourCakeState> {
  BuildYourCakeCubit() : super(BuildYourCakeInitialState()) {
    imageUrl = images['circle'] ?? '';
  }

  final List<Map<String, dynamic>> features = [
    {'title': 'الشكل', 'icon': Icons.cake},
    {'title': 'النكهة', 'icon': Icons.icecream},
    {'title': 'اللون', 'icon': Icons.color_lens},
  ];

  int step = 0;

  String shapeId = '';
  String flavorId = '';
  Color? cakeColor;

  String imageId = '';
  String imageUrl = '';

  void changeFeature(int index) {
    step = index;
    emit(BuildYourCakeChangeFeatureState(index: index));
  }

  void nextStep() {
    if (step == features.length - 1) {
      return;
    }
    step++;
    emit(BuildYourCakeChangeFeatureState(index: step));
  }

  void refreshCakeImage() {
    imageId = '';

    if (shapeId != '') {
      imageId = shapeId;
    }
    if (flavorId != '') {
      imageId += '-$flavorId';
    }

    print(imageId);
    print(images[imageId]);
    print(images['heart-pistachio']);

    imageUrl = images[imageId] ?? '';

    emit(BuildYourCakeImageState(imageUrl: imageUrl));
  }

  void changeShape(String id) {
    shapeId = id;
    refreshCakeImage();
  }

  void changeFlavor(String id) {
    flavorId = id;
    refreshCakeImage();
  }

  void changeColor(Color color) {
    if (color == Colors.transparent) {
      cakeColor = null;
      emit(BuildYourCakeChangeColorState(color: null));
      return;
    }

    flavorId = '';
    refreshCakeImage();

    cakeColor = color;
    emit(BuildYourCakeChangeColorState(color: color));
  }
}
