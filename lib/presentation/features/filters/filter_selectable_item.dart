import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class FilterSelectableItem extends StatelessWidget {
  final bool isSelected;
  final String text;

  const FilterSelectableItem({ this.isSelected = false, required this.text}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.linePadding),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border:
                  Border.all(color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColorLight),
              color: isSelected ? Theme.of(context).colorScheme.secondary : AppColors.white),
          padding: EdgeInsets.symmetric(vertical: AppSizes.sidePadding, horizontal: AppSizes.sidePadding),
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: isSelected ? AppColors.white : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ));
  }
}
