import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';

class BookRating extends StatelessWidget {
  final int averageRating;
  final int? totalCount;

  const BookRating({
    Key? key,
    required this.averageRating,
    required this.totalCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filledCount = averageRating;
    final unfilledCount = 5 - averageRating;
    return Row(
      children: [
        ...List<Widget>.generate(
          filledCount,
          (_) => const Icon(
            Icons.star,
            color: AppTheme.accentColor,
            size: 16,
          ),
        ),
        ...List<Widget>.generate(
          unfilledCount,
          (_) => const Icon(
            Icons.star_outline,
            color: AppTheme.accentColor,
            size: 16,
          ),
        ),
        if (totalCount != null) ...[
          const SizedBox(
            width: 4,
          ),
          Text(
            '(${totalCount!})',
            style: const TextStyle(
              fontFamily: AppTheme.accentFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppTheme.accentColor,
            ),
          ),
        ]
      ],
    );
  }
}
