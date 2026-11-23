# Meals App

A Flutter application for browsing recipes and meal categories with real-time dietary filtering and favorite tracking, built using Flutter and Riverpod for state management.

## Features

- **Category Browsing**: Browse meals organized across different categories (Italian, Quick & Easy, Hamburgers, etc.) with entry slide animations.
- **Meal Details**: View preparation duration, complexity, affordability rating, complete ingredient lists, and step-by-step instructions.
- **Dietary Filters**: Toggle dietary constraints in real time:
  - Gluten-free
  - Lactose-free
  - Vegetarian
  - Vegan
- **Favorites**: Bookmark favorite meals with animated toggle interactions and quick undo/status snackbars.
- **Tab & Drawer Navigation**: Bottom tab navigation between Categories and Favorites, with a side drawer to access dietary filters.
- **Hero Transitions**: Smooth image transitions between list cards and meal detail screens.

## Tech Stack

- **Framework**: Flutter (Dart SDK `^3.10.7`)
- **State Management**: [Riverpod](https://riverpod.dev/) (`flutter_riverpod`, `state_notifier`)
- **UI & Styling**: Material 3 (Dark Theme), [Google Fonts (Lato)](https://pub.dev/packages/google_fonts)
- **Image Caching / Loading**: `transparent_image` for smooth fade-in network images

## Project Structure

```text
lib/
├── data/
│   └── dummy_data.dart         # Category definitions and sample meal data
├── models/
│   ├── category.dart           # Category data model
│   └── meal.dart               # Meal model, Complexity & Affordability enums
├── providers/
│   ├── favorite_provider.dart  # StateNotifier for bookmarked favorite meals
│   ├── filters_provider.dart   # Filter state notifier and filteredMealsProvider
│   └── meals_provider.dart     # Base provider exposing all available meals
├── Screens/
│   ├── categories.dart         # Animated grid of meal categories
│   ├── filter_screen.dart      # Dietary filter toggle switches
│   ├── meal_details_screen.dart# Full meal overview, ingredients & steps
│   ├── meals.dart              # Filtered meals list view
│   └── tabs_screen.dart        # Main navigation shell (tabs + drawer)
├── widgets/
│   ├── category_grid_item.dart # Grid tile for individual categories
│   ├── main_drawer.dart        # Navigation drawer
│   ├── meal_item.dart          # Card widget displaying meal summary & traits
│   └── meal_item_trait.dart    # Helper widget for icon + text metadata
└── main.dart                   # App entrypoint and theme configuration
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- An Android emulator, iOS simulator, or physical device connected

### Run the App

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
