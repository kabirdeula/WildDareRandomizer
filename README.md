# Uno Dare Randomizer

[![wakatime](https://wakatime.com/badge/user/d843d77e-df9e-4be5-a842-ed311ba05a54/project/8533cf97-64f5-4e23-b107-8d8ebf28c5b2.svg)](https://wakatime.com/badge/user/d843d77e-df9e-4be5-a842-ed311ba05a54/project/8533cf97-64f5-4e23-b107-8d8ebf28c5b2)
![Flutter Version](https://img.shields.io/badge/Flutter-3.22.1-blue)
![License](https://img.shields.io/badge/license-MIT-blue.svg)


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

## Changelog

For a detailed list of changed, see the [Changelog](./CHANGELOG.md).

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
