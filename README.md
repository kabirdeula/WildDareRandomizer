# Uno Dare Randomizer

A Flutter app that provides a randomized list of Uno Dare rules for an exciting gameplay experience, available as a web app on Firebase Hosting.

## Features

- **Randomized Rule Generator**: Create unpredictable and fun rule sets for Uno Dare.
- **Customizable Rule List**: Add, edit, or remove custom rules.
- **Light and Dark Mode**: Switch between light and dark themes.
- **Grid and List Views**: Choose between grid or list display modes for your rules.

## Getting Started

### Prerequisites

- **Flutter SDK**: Version 3.22.1 or higher
- **Firebase Account**: Needed for web app hosting.

### Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/username/WildDareRandomizer.git
   cd WildDareRandomizer
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**

- Ensure Firebase is set up in the app. Follow the steps to add a Firebase web app and configure your `firebase_options.dart` file.

4. **Run the app:**
   ```bash
   flutter run -d chrome
   ```

### Deploying to Firebase Hosting

1. **Build the web version:**

   ```bash
   flutter build web
   ```

2. **_Deploy:_**
   `bash
 firebase deploy --only hosting
 `
   The app will be live at the URL provided by Firebase Hosting.

## Contributing

Contributions are welcome! Please read the `CONTRIBUTING.md` for guidelines on how to get started.

## Changelog

For a detailed list of changed, see the [Changelod](./CHANGELOG.md).

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
