---
applyTo: "**"
---

## **Project Overview**

This is a Flutter mobile application that:

- Uses **MVVM** architecture
- Uses **Cubit** for state management
- Uses **getIt** for dependency injection
- Supports **dynamic theming** (light/dark)
- Supports **localization** (multi-language, including Arabic and French)
- Organizes code into **core** (shared) and **features** folders
- Implements **clean architecture principles**

---

## **1. Folder Structure**

```
lib/
 ├── core/
 │    ├── config/            # App-wide constants, environment configs
 │    ├── di/                # Dependency injection setup (getIt)
 │    ├── localization/      # App localization setup
 │    ├── theme/             # Theme and color palette (light/dark)
 │    ├── router/            # App navigation setup
 │    ├── utils/             # Helper functions and extensions
 │    └── widgets/           # Shared UI components
 │
 ├── features/
 │    ├── feature_name/
 │    │    ├── model/        # Data models (plain Dart classes)
 │    │    ├── view/         # UI layer (widgets, pages)
 │    │    ├── viewmodel/    # Cubit classes (state + logic)
 │    │    └── repository/   # Data source access logic
 │
 └── main.dart
```

---

## **2. State Management**

- **Cubit** classes should:
  - Expose immutable `State` objects
  - Contain all UI logic inside `viewmodel/`
  - Be injected via **getIt**
- UI components subscribe to `Cubit` via `BlocBuilder` or `BlocConsumer`

---

## **3. Dependency Injection**

- Use **getIt** singleton in `core/di/injection.dart`
- Register **repositories**, **services**, and **cubits/viewmodels** in DI
- Example:

```dart
final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl());
}
```

---

## **4. Dynamic Theme**

- Store theme preference (light/dark/system) in persistent storage
- `ThemeCubit` manages theme state and updates `MaterialApp.themeMode`
- Keep `light_theme.dart` and `dark_theme.dart` inside `core/theme/`

---

## **5. Localization**

- Use Flutter’s `intl` package or `easy_localization`
- All text is defined in **ARB** files or `.json` localization files
- Store them in `core/localization/`
- Support **Arabic** (ar) and **French** (fr) by default

---

## **6. Coding Style**

- Follow **Dart & Flutter style guide**
- Use `const` wherever possible for performance
- Keep widgets small and composable
- Avoid business logic in UI classes

---

## **7. Testing**

- Write unit tests for **Cubit** logic
- Use widget tests for UI
- Mock dependencies with `mocktail` or `mockito`

---

## **8. Example Feature Folder (Organs)**

```
features/
 ├── organs/
 │    ├── model/organ.dart
 │    ├── view/organs_page.dart
 │    ├── viewmodel/organs_cubit.dart
 │    └── repository/organs_repository.dart
```

---

## **9. Performance Best Practices**

- Use `const` constructors wherever possible.
- Avoid rebuilding large widgets unnecessarily; split into smaller widgets.
- Use `ListView.builder` / `GridView.builder` for long lists.
- Prefer `const SizedBox()` over `Container()` for spacing.
- Dispose of controllers, streams, and animations in `dispose()`.

---

## **10. Code Organization**

- One public class per file.
- Keep files short (max ~300 lines).
- Separate platform-specific code (Android/iOS/Web) where necessary.

---

## **11. UI Consistency**

- Store colors, typography, and spacing in a central theme.
- Use shared widgets for reusable UI components (buttons, cards, loaders).
- Follow a defined design system.

---

## **12. Error Handling**

- Use a global error handler for uncaught exceptions.
- Return **Result/Either** types from repositories instead of throwing.
- Display user-friendly error messages.

---

## **13. Networking**

- Keep API services inside `core/network/`.
- Always handle API errors gracefully and log them.
- Implement caching where appropriate.

---

## **14. Accessibility**

- Provide `semanticsLabel` for images/icons.
- Ensure text scales with system font settings.
- Maintain strong contrast between text and background.

---

## **15. Git & Documentation**

- Commit small, logical changes with clear messages.
- Maintain a `README.md` with setup instructions and tech stack.
- Use inline comments for complex logic.

---
