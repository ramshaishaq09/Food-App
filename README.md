# FOOD APP (Flutter)

A 4-screen food-ordering UI built entirely with  Flutter layout
widgets.

## Pages
1. **Login** (`lib/screens/login_page.dart`) — StatefulWidget.
2. **Signup** (`lib/screens/signup_page.dart`) — StatefulWidget.
3. **Home** (`lib/screens/home_page.dart`) — StatefulWidget.
4. **Profile** (`lib/screens/profile_page.dart`) — StatelessWidget.

## Run it
```bash
flutter pub get
flutter run
```

## Structure
```
lib/
  main.dart                     # MaterialApp (GetX) + named routes
  models/menu_item.dart         # MenuItem data model
  data/menu_data.dart           # Demo menu catalog
  widgets/menu_item_card.dart   # Reusable Card used in the Home grid
  routes/
    app_routes.dart
    route_managment.dart
  screens/
    login_page.dart
    signup_page.dart
    home_page.dart
    profile_page.dart
```
# Food-App
