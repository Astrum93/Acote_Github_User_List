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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse('https://taxrefundgo.kr'));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://placehold.it/500x100?text=ad',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
