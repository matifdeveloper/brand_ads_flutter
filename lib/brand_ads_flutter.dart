library;

import 'package:flutter/material.dart';
import 'package:brand_ads_flutter/utils/image_view.dart';
import 'package:brand_ads_flutter/utils/extensions.dart';

/// Different ad types with predefined sizes
enum BrandAdType {
  banner, // 320x50
  largeBanner, // 320x100
  fullBanner, // 468x60
  leaderboard, // 728x90
}

/// Core BrandAd widget
class BrandAd extends StatefulWidget {
  final BrandAdType adType;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final double borderRadius;
  final VoidCallback? onClick;
  final VoidCallback? onView;

  const BrandAd({
    super.key,
    required this.adType,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.buttonText,
    this.onClick,
    this.onView,
    this.borderRadius = 10,
    this.backgroundColor = const Color(0xFFFFF3E0), // default orange.shade50
    this.buttonColor = Colors.deepOrange, // default button color
    this.buttonTextColor = Colors.white, // default text color
  });

  @override
  State<BrandAd> createState() => _BrandAdState();
}

class _BrandAdState extends State<BrandAd> {
  late double _width;
  late double _height;

  @override
  void initState() {
    super.initState();

    // Map adType → size
    switch (widget.adType) {
      case BrandAdType.banner:
        _width = 320;
        _height = 50;
        break;
      case BrandAdType.largeBanner:
        _width = 320;
        _height = 100;
        break;
      case BrandAdType.fullBanner:
        _width = 468;
        _height = 60;
        break;
      case BrandAdType.leaderboard:
        _width = 728;
        _height = 90;
        break;
    }

    // Fire onView callback after widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onView?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _width,
        height: _height,
        // margin removed
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: Colors.orange.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.kOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            // Thumbnail / Logo
            if (widget.imageUrl.isNotEmpty)
              ImagePreview(
                width: _height - 8,
                height: _height - 8,
                url: widget.imageUrl,
              ),

            // Text Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ad · ${widget.title}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // CTA Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.buttonColor,
                foregroundColor: widget.buttonTextColor,
                textStyle: TextStyle(
                  fontSize: 12,
                  color: widget.buttonTextColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(60, 30),
              ),
              onPressed: widget.onClick,
              child: Text(widget.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
