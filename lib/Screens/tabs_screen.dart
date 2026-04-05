import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Screens/categories.dart';
import 'package:meals/Screens/filter_screen.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/widgets/main_drawer.dart';

const kinitialFilters = {
  Filter.gltenfree: false,
  Filter.lactosefree: false,
  Filter.vegiterian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kinitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilter: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = results ?? kinitialFilters;
      });
    }
    // } else {
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeal = meals.where((meal) {
      if (_selectedFilters[Filter.gltenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreen(availableMeals: availableMeal);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Your Favorities';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
