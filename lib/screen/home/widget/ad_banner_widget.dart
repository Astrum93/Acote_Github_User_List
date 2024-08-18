import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdBanner extends StatefulWidget {
  const AdBanner({
    super.key,
  });

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  String url = 'https://placehold.it/500x100?text=ad';
  String adUrl = 'https://taxrefundgo.kr';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(adUrl));
      },
      child: Image.network(
        url,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.image_not_supported_outlined,
            size: 50,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
