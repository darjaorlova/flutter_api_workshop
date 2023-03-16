import 'package:flutter/material.dart';
import 'package:flutter_api_workshop/design_system/search_bar.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;

  const SliverSearchAppBar({
    Key? key,
    required this.controller,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      SearchBar(controller: controller);

  @override
  double get maxExtent => 108;

  @override
  double get minExtent => 108;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
