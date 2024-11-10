import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

/// A model representing the user's settings configuration.
///
/// The `SettingsModel` class stores preferences that control the
/// display mode (light or dark) and layout style (grid or list) in the app.
@freezed
class SettingsModel with _$SettingsModel {
  /// Creates a new `SettingsModel` instance.
  ///
  /// - [isDarkMode]: If `true`, the app uses a dark color scheme. Defaults to `false`.
  /// - [isGridView]: If 'true', items are displayed in a grid view; otherwise,
  /// they are displayed in a list view. Defaults to `true`.
  const factory SettingsModel({
    /// A boolean indicating whether dark mode is enabled.
    @Default(false) bool isDarkMode,

    /// A boolean indicating whether items are displayed in a grid view.
    @Default(true) bool isGridView,
  }) = _SettingsModel;

  /// Creates a `SettingsModel` instance from a JSON map.
  ///
  /// This factory allows `SettingsModel` instances to be created from JSON,
  /// making it easier to persist and retrieve user preferences.
  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}
