import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCAtegory,
  });

  final Category category;

  final void Function() onSelectCAtegory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCAtegory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: .55),
              category.color.withValues(alpha: .9),
            ],

            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),

        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
