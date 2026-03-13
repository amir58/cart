abstract class BuildYourCakeState {}

class BuildYourCakeInitialState extends BuildYourCakeState {}

class BuildYourCakeImageState extends BuildYourCakeState {
  final String image;

  BuildYourCakeImageState({required this.image});
}


class BuildYourCakeChangeFeatureState extends BuildYourCakeState {
  final int index;

  BuildYourCakeChangeFeatureState({required this.index});
}