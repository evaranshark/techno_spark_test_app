import 'package:flutter/material.dart';

class ContentModel with ChangeNotifier {
  String? _text;
  String? _asset;

  static const String _text1 =
      """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Rhoncus aenean vel elit scelerisque. Nisl vel pretium lectus quam id leo. A diam maecenas sed enim ut sem viverra aliquet eget. Tincidunt tortor aliquam nulla facilisi. Nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Orci phasellus egestas tellus rutrum. Neque vitae tempus quam pellentesque nec nam. Ac orci phasellus egestas tellus.

Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Vulputate odio ut enim blandit. Vulputate ut pharetra sit amet. Sed ullamcorper morbi tincidunt ornare. Scelerisque viverra mauris in aliquam sem. Ipsum faucibus vitae aliquet nec ullamcorper sit. Volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Malesuada fames ac turpis egestas sed tempus urna et. Enim praesent elementum facilisis leo vel fringilla. Volutpat ac tincidunt vitae semper quis lectus nulla at volutpat. Adipiscing diam donec adipiscing tristique risus nec feugiat in fermentum. Viverra nam libero justo laoreet. Ultrices eros in cursus turpis massa tincidunt dui ut. Quisque sagittis purus sit amet volutpat. Risus quis varius quam quisque. Ac odio tempor orci dapibus ultrices. Magna etiam tempor orci eu lobortis elementum nibh tellus molestie. Odio ut sem nulla pharetra diam sit amet nisl suscipit. Id diam maecenas ultricies mi eget mauris pharetra.

Nunc aliquet bibendum enim facilisis. Orci eu lobortis elementum nibh. Risus in hendrerit gravida rutrum quisque non tellus. Imperdiet massa tincidunt nunc pulvinar sapien et. Vel orci porta non pulvinar. Etiam erat velit scelerisque in. Augue mauris augue neque gravida in fermentum et sollicitudin. Tortor posuere ac ut consequat semper viverra. Pulvinar etiam non quam lacus suspendisse. Ultrices in iaculis nunc sed augue. Sit amet porttitor eget dolor morbi non. Pellentesque id nibh tortor id aliquet lectus proin. Quam nulla porttitor massa id neque aliquam. Sollicitudin tempor id eu nisl nunc mi. Cursus in hac habitasse platea dictumst quisque sagittis purus sit. Eu feugiat pretium nibh ipsum consequat nisl vel pretium. Odio euismod lacinia at quis risus sed vulputate odio ut. Nullam eget felis eget nunc lobortis mattis. Netus et malesuada fames ac turpis egestas maecenas. Quam lacus suspendisse faucibus interdum.

Tincidunt dui ut ornare lectus sit amet est placerat in. Quam pellentesque nec nam aliquam sem et tortor consequat. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Commodo odio aenean sed adipiscing diam. Purus ut faucibus pulvinar elementum integer enim neque. Ornare massa eget egestas purus. Cursus eget nunc scelerisque viverra mauris in. Massa tempor nec feugiat nisl pretium fusce id. Et netus et malesuada fames ac turpis egestas sed. Tempor commodo ullamcorper a lacus vestibulum. Nisl condimentum id venenatis a condimentum. Quis viverra nibh cras pulvinar mattis nunc sed blandit libero. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Tempus urna et pharetra pharetra. Viverra aliquet eget sit amet tellus cras adipiscing. Tempus egestas sed sed risus pretium quam vulputate.

Morbi tristique senectus et netus et malesuada. Sed vulputate mi sit amet mauris commodo quis imperdiet. Sed turpis tincidunt id aliquet risus feugiat in ante metus. Non odio euismod lacinia at quis risus sed vulputate. Lacus vel facilisis volutpat est velit egestas dui id. Suspendisse interdum consectetur libero id faucibus nisl. Nibh venenatis cras sed felis eget velit. Porttitor rhoncus dolor purus non enim praesent elementum facilisis. Massa tincidunt nunc pulvinar sapien et. Et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut. Congue mauris rhoncus aenean vel elit scelerisque mauris. Tincidunt eget nullam non nisi.""";

  static const String _text2 =
      """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lacinia quis vel eros donec ac odio tempor. At imperdiet dui accumsan sit amet.""";
  static const String _defaultAsset = "assets/cat.jpeg";
  final _texts = [_text1, _text2, _defaultAsset];
  ContentModel({String? text}) : _text = text;

  String? get text => _text;
  String? get assetPath => _asset;

  void setText(int index) {
    _text = _texts[index];
    _asset = null;
    notifyListeners();
  }

  void setImage() {
    _asset = _defaultAsset;
    _text = null;
    notifyListeners();
  }
}
