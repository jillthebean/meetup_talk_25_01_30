import 'package:flutter/material.dart';

class PrimaryColors {
  static Color vibrantRed = const Color.fromARGB(255, 251, 82, 5);
  static Color deepBlue = const Color.fromARGB(255, 33, 33, 68);
  static Color calmSand = const Color.fromARGB(255, 250, 248, 248);
}

class SecondaryColors {
  static Color irisBlue = const Color.fromARGB(255, 83, 74, 204);
  static Color lavender = const Color.fromARGB(255, 223, 224, 252);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
}

class NeutralColors {
  static const Color sand10 = Color.fromARGB(255, 251, 249, 249);
  static const Color sand20 = Color.fromARGB(255, 246, 244, 243);
  static const Color sand30 = Color.fromARGB(255, 243, 237, 237);
  static const Color sand40 = Color.fromARGB(255, 232, 223, 221);
  static const Color sand50 = Color.fromARGB(255, 218, 207, 205);
  static const Color sand60 = Color.fromARGB(255, 203, 190, 188);
  static const Color sand70 = Color.fromARGB(255, 185, 172, 168);
  static const Color sand80 = Color.fromARGB(255, 165, 152, 148);
  static const Color sand90 = Color.fromARGB(255, 144, 131, 129);
  static const Color sand100 = Color.fromARGB(255, 122, 112, 110);
  static const Color sand110 = Color.fromARGB(255, 100, 92, 91);
  static const Color sand120 = Color.fromARGB(255, 78, 73, 72);
  static const Color sand130 = Color.fromARGB(255, 57, 55, 55);
  static const Color sand140 = Color.fromARGB(255, 40, 38, 38);
  static const Color sand150 = Color.fromARGB(255, 22, 22, 21);
  static const Color sand160 = Color.fromARGB(255, 4, 4, 4);
}

class BackgroundGradients {
  // linear-gradient(99.27deg, rgba(33, 33, 102, 1.0) 0%, rgba(67, 65, 188, 1.0) 100%)
  static Gradient mountainDescend = const LinearGradient(
    colors: [
      Color.fromARGB(255, 33, 33, 102),
      Color.fromARGB(255, 67, 65, 188),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // linear-gradient(180.0deg, rgba(33, 33, 68, 1.0) 0%, rgba(39, 39, 117, 1.0) 100%)
  static Gradient nightsky = const LinearGradient(
    colors: [
      Color.fromARGB(255, 33, 33, 68),
      Color.fromARGB(255, 39, 39, 117),
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}

class AccentGradients {
  // linear-gradient(90.0deg, rgba(45, 37, 112, 1.0) 15%, rgba(252, 106, 86, 1.0) 100%)
  static Gradient sunrise = const LinearGradient(
    colors: [
      Color.fromARGB(255, 45, 37, 112),
      Color.fromARGB(255, 252, 106, 86),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // linear-gradient(90.0deg, rgba(83, 74, 204, 1.0) 0%, rgba(252, 106, 86, 1.0) 94%)
  static Gradient sunset = const LinearGradient(
    colors: [
      Color.fromARGB(255, 83, 74, 204),
      Color.fromARGB(255, 252, 106, 86),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // linear-gradient(90.0deg, rgba(250, 98, 77, 1.0) 0%, rgba(255, 255, 255, 1.0) 100%)
  static Gradient sunburnWhite = const LinearGradient(
    colors: [
      Color.fromARGB(255, 250, 98, 77),
      Color.fromARGB(255, 255, 255, 255),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
