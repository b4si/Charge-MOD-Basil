import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String keyUserId = 'user_id';
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';

  // Save user data to SharedPreferences
  static Future<void> saveUserData({
    required String userId,
    required String accessToken,
    required String refreshToken,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(keyUserId, userId);
    await prefs.setString(keyAccessToken, accessToken);
    await prefs.setString(keyRefreshToken, refreshToken);
  }

  // Get user data from SharedPreferences
  static Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(keyUserId);
    String? accessToken = prefs.getString(keyAccessToken);
    String? refreshToken = prefs.getString(keyRefreshToken);

    return {
      keyUserId: userId,
      keyAccessToken: accessToken,
      keyRefreshToken: refreshToken,
    };
  }

  // Update only the access token and refresh token
  static Future<void> updateTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(keyUserId);

    if (userId != null) {
      await prefs.setString(keyAccessToken, accessToken);
      await prefs.setString(keyRefreshToken, refreshToken);
    }
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyUserId);
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static const String keyLoggedIn = 'logged_in';

  static Future<void> setLoggedIn(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyLoggedIn, loggedIn);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyLoggedIn) ?? false;
  }
}
