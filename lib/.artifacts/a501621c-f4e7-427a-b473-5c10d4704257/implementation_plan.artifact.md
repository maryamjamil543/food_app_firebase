# Implementation Plan: Fix Session Persistence with SharedPreferences

The user is experiencing an issue where they are not automatically navigated to the home screen even after logging in. This is because the application always starts with the `IntroScreen` and does not check the `isLoggedIn` flag stored in `SharedPreferences` at startup.

## Proposed Changes

### [Component Name] Flutter App Startup

#### [MODIFY] [main.dart](file:///C:/Users/HP/Documents/Mobile_App/food_app_design/lib/main.dart)
- Import `shared_preferences`.
- Modify the `main` function to initialize `SharedPreferences` and read the `isLoggedIn` flag.
- Update `MyApp` to accept the `isLoggedIn` flag as a parameter.
- Use the `isLoggedIn` flag to determine whether to set `IntroScreen` or `BottomNav` as the `home` widget.

#### [MODIFY] [intro.dart](file:///C:/Users/HP/Documents/Mobile_App/food_app_design/lib/screens/intro.dart)
- (Optional but recommended) Add a similar check in `IntroScreen`'s `build` or `initState` as a fallback, although fixing it in `main.dart` is more efficient as it avoids building the intro screen entirely.

#### [MODIFY] [login.dart](file:///C:/Users/HP/Documents/Mobile_App/food_app_design/lib/screens/login.dart)
- Ensure that the navigation to `BottomNav` is correct (it currently is).

## Verification Plan

### Manual Verification
1. Run the app for the first time: it should show `IntroScreen`.
2. Navigate to `LoginScreen` and log in successfully.
3. Observe that it goes to `BottomNav`.
4. Close the app completely.
5. Restart the app: it should now go directly to `BottomNav` (or `HomeScreen` within it) without showing `IntroScreen` or `LoginScreen`.
