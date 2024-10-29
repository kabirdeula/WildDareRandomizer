class ValidationUtils {
  static bool isValidRuleTitle(String title) {
    return title.isNotEmpty && title.length > 3;
  }

  static bool isValidRuleDescription(String description) {
    return description.isNotEmpty;
  }
}
