enum Routes {
  initial('/'),
  favorites('/favorites'),

  settings('/settings');

  final String path;
  const Routes(this.path);
}
