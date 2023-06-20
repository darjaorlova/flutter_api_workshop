import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/app_theme.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final accent = AppTheme.accentColor;
  final grey = AppTheme.grayMedium;

  const AppSearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      color: AppTheme.primaryColor,
      width: MediaQuery.of(context).size.width - 32,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.primaryColor,
          focusColor: accent,
          focusedBorder: _border(accent),
          border: _border(grey),
          enabledBorder: _border(grey),
          hintText: 'Start book search...',
          hintStyle: const TextStyle(
            color: AppTheme.grayDark,
            fontSize: 16,
            fontFamily: AppTheme.accentFontFamily,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          prefixIcon: const Icon(
            Icons.search,
            color: AppTheme.grayDark,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(28),
      );
}
