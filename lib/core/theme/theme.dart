import 'package:flutter/material.dart';

class AppColors{
  static const primaryColor = Colors.blueAccent;
  static const senderAvatarColor = Colors.pinkAccent;
  static const receiverChatBoxColor = Colors.grey;
  static const gradientColors = [Color(0xFF6B00D7), Color(0xFF953DF5),Color.fromARGB(255, 80, 97, 227)];
  static const senderChatBoxColor = Color.fromARGB(255, 27, 70, 243);
  static const receiverChatTextColor = Colors.black;
  static const senderChatTextColor = Colors.white;
}

class AppTypography{
  static final titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey[900],
  );
  static final titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey[900],
  );
  static final titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey[900],
  );
}

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.titleLarge,
      titleLarge: AppTypography.titleMedium,
      titleMedium: AppTypography.titleSmall,
    ),
  );
}