import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user1,
          height: 56,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user2,
          height: 56,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.user3,
          height: 56,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem1,
          width: double.maxFinite,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem2,
          width: double.maxFinite,
        ),
        const SizedBox(height: 8),
        Image.asset(
          AppImages.paisagem3,
          width: double.maxFinite,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
