import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/Screens/filter_screen.dart';

enum Filter { gltenfree, lactosefree, vegiterian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.gltenfree: false,
        Filter.lactosefree: false,
        Filter.vegiterian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider = StateNotifierProvider((ref) => FiltersNotifier());
