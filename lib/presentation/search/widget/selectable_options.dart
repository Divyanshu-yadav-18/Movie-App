import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';

class SelectableOptions extends StatelessWidget {
  final String title;
  final bool isSelectable;
  final VoidCallback onTap;
  const SelectableOptions({
    super.key,
    required this.title,
    required this.isSelectable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelectable ? AppColor.primary : AppColor.secondBackground),
        child: Center(child: Text(title)),
      ),
    );
  }
}
