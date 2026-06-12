import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/services/image_memory_cache.dart';
import 'package:flutter/material.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final Color? placeholderColor;
  final EdgeInsetsGeometry? margin;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;
  final bool useHero;
  final Object? heroTag;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.placeholderColor,
    this.margin,
    this.errorBuilder,
    this.useHero = false,
    this.heroTag,
  });

  Widget _buildImage(BuildContext context) {
    final cached = ImageMemoryCache.instance.get(imageUrl);
    if (cached != null) {
      return _buildMemoryImage(cached);
    }
    return _buildNetworkImage();
  }

  Widget _buildMemoryImage(Uint8List bytes) {
    Widget image = Image.memory(
      bytes,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, _, _) => _buildErrorWidget(),
    );
    if (borderRadius != null && shape == BoxShape.rectangle) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 100),
      placeholder: (_, _) => _buildPlaceholder(),
      errorWidget: errorBuilder ?? (_, _, _) => _buildErrorWidget(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeholderColor ?? Colors.grey.shade200,
        borderRadius: shape == BoxShape.circle ? null : borderRadius,
        shape: shape,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: shape == BoxShape.circle ? null : borderRadius,
        shape: shape,
      ),
      child: Icon(Icons.image_not_supported, size: 30, color: Colors.grey.shade400),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage(context);

    if (margin != null) {
      image = Padding(padding: margin!, child: image);
    }

    if (useHero && heroTag != null) {
      image = Hero(tag: heroTag!, child: image);
    }

    return image;
  }
}
