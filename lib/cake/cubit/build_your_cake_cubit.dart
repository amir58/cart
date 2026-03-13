import 'package:cart/cake/cubit/build_your_cake_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, String> images = {
  'circle': 'https://i.ibb.co/wNXqkMbD/IMG-5764.jpg',
  'circle-redvelvet': 'https://i.ibb.co/fGH2q036/IMG-5769.jpg',
  'circle-pistachio': 'https://i.ibb.co/NdPDpVDy/IMG-5770.jpg',
  'heart': 'https://i.ibb.co/8LgZkHsM/IMG-5765.jpg',
  'heart-redvelvet': 'https://i.ibb.co/x8ds7WQG/IMG-5772.jpg',
  'heart-pistachio': 'https://i.ibb.co/Tq2P2mvb/IMG-5771.jpg',
};

String shape = 'circle';
String flavor = '';
String color = '';

class BuildYourCakeCubit extends Cubit<BuildYourCakeState> {
  BuildYourCakeCubit() : super(BuildYourCakeInitialState());

  String shapeId = '';
  String flavorId = '';

  void changeFeature(int index) {
    emit(BuildYourCakeChangeFeatureState(index: index));
  }

  void refreshCakeImage() {
    String imageId = '';

    if (shapeId != '') {
      imageId = shapeId;
    }
    if (flavorId != '') {
      imageId += '-$flavorId';
    }

    print(imageId);
    print(images[imageId]);
    print(images['heart-pistachio']);

    emit(BuildYourCakeImageState(image: images[imageId] ?? ''));
  }

  void changeShape(String id) {
    shapeId = id;
    refreshCakeImage();
  }

  void changeFlavor(String id) {
    flavorId = id;
    refreshCakeImage();
  }
}
