import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';

class BookDetailsCoverImage extends StatelessWidget {
  final String imageUrl;

  const BookDetailsCoverImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 200.0;
    final width = MediaQuery.of(context).size.width - 32;

    return Container(
      margin: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
        top: 8,
      ),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: imageUrl.isNotEmpty == true
            ? Image.network(
                imageUrl,
                height: height,
                width: width,
                fit: BoxFit.fitWidth,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: height,
                    width: width,
                    color: AppTheme.accentColorLight,
                  );
                },
              )
            : Container(
                height: height,
                width: width,
                color: AppTheme.accentColorLight,
              ),
      ),
    );
  }
}
