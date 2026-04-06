import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

//another way way to handle filter

// class FilterScreen extends ConsumerStatefulWidget {
//   const FilterScreen({super.key});

//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _gluteenFreeMealFilter = false;
//   var _lactoseFreeMealFilter = false;
//   var _vegeterianMealFilter = false;
//   var _veganMealFilter = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilter = ref.read(filtersProvider);
//     _gluteenFreeMealFilter = activeFilter[Filter.gltenfree]!;
//     _lactoseFreeMealFilter = activeFilter[Filter.lactosefree]!;
//     _vegeterianMealFilter = activeFilter[Filter.vegiterian]!;
//     _veganMealFilter = activeFilter[Filter.vegan]!;
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Your Filters')),
//     // drawer: MainDrawer(
//     //   onSelectScreen: (identifier) {
//     //     Navigator.of(context).pop();
//     //     if (identifier == 'meals') {
//     //       Navigator.of(context).push(
//     //         MaterialPageRoute(
//     //           builder: (ctx) => TabsScreen(onToggleFavorite: (meal) {}),
//     //         ),
//     //       );
//     //     }
//     //   },
//     // ),
//     body: PopScope(
//       canPop: true,
//       onPopInvoked: (bool didPop) {
//         if (didPop) return;
//         ref.read(filtersProvider.notifier).setFilters({
//           Filter.gltenfree: _gluteenFreeMealFilter,
//           Filter.lactosefree: _lactoseFreeMealFilter,
//           Filter.vegiterian: _vegeterianMealFilter,
//           Filter.vegan: _veganMealFilter,
//         });
//       },

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFlters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),

      body: Column(
        children: [
          SwitchListTile(
            value: activeFlters[Filter.gltenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gltenfree, ischecked);
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
            value: activeFlters[Filter.lactosefree]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosefree, ischecked);
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
            value: activeFlters[Filter.vegiterian]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegiterian, ischecked);
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
            value: activeFlters[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, ischecked);
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
    );
  }
}
