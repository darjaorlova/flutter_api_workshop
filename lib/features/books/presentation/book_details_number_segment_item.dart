import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';

class BookDetailsNumberSegmentItem extends StatelessWidget {
  final String title;
  final String count;

  const BookDetailsNumberSegmentItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.accentColor,
          width: 0.75,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.grayDark,
              fontFamily: AppTheme.accentFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.accentColor,
              fontFamily: AppTheme.primaryFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
