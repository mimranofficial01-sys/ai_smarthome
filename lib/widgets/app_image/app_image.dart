import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';

/// A performance-optimized image widget that handles network images smoothly
/// with automatic URL optimization for Unsplash, memory decoding bounds,
/// loading indicators, and fallback rendering for Web, Mobile, and Desktop.
class AppImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData fallbackIcon;
  final int? cacheWidth;
  final int? cacheHeight;

  const AppImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.fallbackIcon = Icons.home_work_rounded,
    this.cacheWidth,
    this.cacheHeight,
  });

  /// Helper utility to append resolution parameters to Unsplash image URLs
  /// to dramatically reduce network transfer size and GPU decode memory.
  static String optimizeUrl(String? url, {int targetWidth = 800}) {
    if (url == null || url.trim().isEmpty) return '';
    final trimmed = url.trim();
    if (trimmed.contains('images.unsplash.com') && !trimmed.contains('w=')) {
      final separator = trimmed.contains('?') ? '&' : '?';
      return '$trimmed${separator}auto=format&fit=crop&w=$targetWidth&q=80';
    }
    return trimmed;
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    final formattedUrl = optimizeUrl(
      imageUrl,
      targetWidth: width != null && width! > 0
          ? (width! * MediaQuery.of(context).devicePixelRatio).round().clamp(150, 1200)
          : 800,
    );

    if (formattedUrl.isNotEmpty) {
      content = Image.network(
        formattedUrl,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            color: navy.withValues(alpha: 0.1),
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: cyan,
                ),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildFallback();
        },
      );
    } else {
      content = _buildFallback();
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return content;
  }

  Widget _buildFallback() {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(gradient: grad),
      alignment: Alignment.center,
      child: Icon(
        fallbackIcon,
        color: Colors.white,
        size: (height != null && height! < 60) ? 28 : 42,
      ),
    );
  }
}
