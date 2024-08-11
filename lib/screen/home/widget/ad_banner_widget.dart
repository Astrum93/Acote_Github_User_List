import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://placehold.it/500x100?text=ad',
          ),
        ),
      ),
    );
  }
}
