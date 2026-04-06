import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _gluteenFreeMealFilter = false;
  var _lactoseFreeMealFilter = false;
  var _vegeterianMealFilter = false;
  var _veganMealFilter = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);
    _gluteenFreeMealFilter = activeFilter[Filter.gltenfree]!;
    _lactoseFreeMealFilter = activeFilter[Filter.lactosefree]!;
    _vegeterianMealFilter = activeFilter[Filter.vegiterian]!;
    _veganMealFilter = activeFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (ctx) => TabsScreen(onToggleFavorite: (meal) {}),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.gltenfree: _gluteenFreeMealFilter,
            Filter.lactosefree: _lactoseFreeMealFilter,
            Filter.vegiterian: _vegeterianMealFilter,
            Filter.vegan: _veganMealFilter,
          });
        },

        child: Column(
          children: [
            SwitchListTile(
              value: _gluteenFreeMealFilter,
              onChanged: (ischecked) {
                setState(() {
                  _gluteenFreeMealFilter = ischecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only Include Gluteen-Free Meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onTertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            ///////////////////
            SwitchListTile(
              value: _lactoseFreeMealFilter,
              onChanged: (ischecked) {
                setState(() {
                  _lactoseFreeMealFilter = ischecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only Include Lactose-Free Meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onTertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),

            //////////////////
            SwitchListTile(
              value: _vegeterianMealFilter,
              onChanged: (ischecked) {
                setState(() {
                  _vegeterianMealFilter = ischecked;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only Include vegeterian Meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onTertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),

            ///////////////////
            SwitchListTile(
              value: _veganMealFilter,
              onChanged: (ischecked) {
                setState(() {
                  _veganMealFilter = ischecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only Include Vegan Meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.onTertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
