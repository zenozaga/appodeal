import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppodealBannerSize {
  const AppodealBannerSize({this.width = 320, this.height = 50});

  final int width;
  final int height;

  static const AppodealBannerSize STANDARD =
      AppodealBannerSize(width: 320, height: 50);
  static const AppodealBannerSize MREC =
      AppodealBannerSize(width: 300, height: 250);
}

class AppodealBanner extends StatelessWidget {
  Map<String, dynamic> _args = {};
  AppodealBannerSize? size;

  AppodealBanner({String? placementName, this.size}) {
    this._args["placementName"] = placementName;
  }

  @override
  Widget build(BuildContext context) {
    var s = size ?? AppodealBannerSize.STANDARD;

    _args["width"] = s.width;
    _args["height"] = s.height;

    return Container(
      width: s.width.toDouble(),
      height: s.height.toDouble(),
      child: Platform.isIOS
          ? UiKitView(
              viewType: 'plugins.io.vinicius.appodeal/banner',
              creationParams: _args,
              creationParamsCodec: const StandardMessageCodec(),
            )
          : AndroidView(
              viewType: 'plugins.io.vinicius.appodeal/banner',
              creationParams: _args,
              creationParamsCodec: const StandardMessageCodec(),
            ),
    );
  }
}
