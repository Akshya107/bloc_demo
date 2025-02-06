import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CacheImagePlaceHolder extends StatefulWidget {
  final String url;
  final double height;
  final double width;

  const CacheImagePlaceHolder(
      {super.key, required this.url, this.height = 220, this.width = 220});

  @override
  State<CacheImagePlaceHolder> createState() => _CacheImagePlaceHolderState();
}

class _CacheImagePlaceHolderState extends State<CacheImagePlaceHolder> {
  String? _previousUrl;
  bool _newImageLoaded = false;

  @override
  void didUpdateWidget(covariant CacheImagePlaceHolder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.url != oldWidget.url) {
      _newImageLoaded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_previousUrl != null)
          Image(
            image: CachedNetworkImageProvider(_previousUrl!),
            height: widget.height,
            width: widget.width,
            fit: BoxFit.contain,
          ),
        CachedNetworkImage(
          imageUrl: widget.url,
          height: widget.height,
          width: widget.width,
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              (_previousUrl != null && !_newImageLoaded)
                  ? const SizedBox()
                  : LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: const [Colors.pink],
                      strokeWidth: 2,
                      backgroundColor: Colors.transparent,
                      pathBackgroundColor: Colors.transparent,
                    ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!_newImageLoaded) {
                setState(() {
                  _previousUrl = widget.url; // Update previous image
                  _newImageLoaded = true;
                });
              }
            });
            return Image(
              image: imageProvider,
              height: widget.height,
              width: widget.width,
              fit: BoxFit.contain,
            );
          },
        ),
      ],
    );
  }
}
