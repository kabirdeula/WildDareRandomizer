enum AppRoutes {
  initial('/'),
  dashboard('/dashboard'),
  home('/home');

  final String path;
  const AppRoutes(this.path);
}
