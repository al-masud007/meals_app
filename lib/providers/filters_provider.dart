import 'package:flutter_riverpod/legacy.dart';

enum Filter { gltenfree, lactosefree, vegiterian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.gltenfree: false,
        Filter.lactosefree: false,
        Filter.vegiterian: false,
        Filter.vegan: false,
      });

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );
