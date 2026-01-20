enum AppRoute {
  initial('/'),

  deckManagement('/deck_management');

  final String path;
  const AppRoute(this.path);
}
