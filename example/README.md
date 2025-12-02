# Liqui Example

This is a showcase app demonstrating all the features of the **Liqui** library.

## Features Demonstrated

### Buttons
- **LiquiScaleTap**: Interactive widget with elastic spring animations on tap and long press
- **LiquiCircleButton**: Circular button with scale animation and shadow effects
- **LiquiCircleButtonGroup**: Group of circular buttons arranged in a row
- **LiquiCloseButton**: Pre-configured close button
- **LiquiMenuButton**: Button that opens a contextual menu

### Modals
- **showLiquiSheet**: Bottom sheet that slides from bottom on mobile, centered dialog on tablet
- **showLiquiPopover**: Popover anchored to a source widget with automatic positioning
- **showLiquiMenu**: Quick menu popover with predefined menu items

## Running the Example

1. Navigate to the example directory:
```bash
cd packages/liqui/example
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Features to Try

- **Tap** the scale tap widget to see smooth elastic animations
- **Long press** the scale tap widget to trigger the long press counter
- **Tap** the circle buttons to see scale animations with shadows
- **Tap** the menu button to see a contextual popover menu
- **Tap** "Show Bottom Sheet" to see a draggable bottom sheet
- **Tap** "Show Popover" to see an anchored popover with buttons
- **Tap** "Show Quick Menu" to see a quick selection menu

## Learn More

Check out the source code in `lib/main.dart` to see how each component is implemented.
