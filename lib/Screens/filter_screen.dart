import 'package:flutter/material.dart';
import 'package:meals/Screens/tabs_screen.dart';
import 'package:meals/main.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter { gltenfree, lactosefree, vegiterian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluteenFreeMealFilter = false;
  var _lactoseFreeMealFilter = false;
  var _vegeterianMealFilter = false;
  var _veganMealFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => TabsScreen(onToggleFavorite: (meal) {}),
              ),
            );
          }
        },
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
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
