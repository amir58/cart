import 'package:flutter/material.dart';

abstract class BuildYourCakeState {}

class BuildYourCakeInitialState extends BuildYourCakeState {}

class BuildYourCakeImageState extends BuildYourCakeState {
  final String imageUrl;

  BuildYourCakeImageState({required this.imageUrl});
}

class BuildYourCakeChangeFeatureState extends BuildYourCakeState {
  final int index;

  BuildYourCakeChangeFeatureState({required this.index});
}

class BuildYourCakeChangeColorState extends BuildYourCakeState {
  final Color? color;

  BuildYourCakeChangeColorState({required this.color});
}
