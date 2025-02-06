import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImagesUtils {
  // -- App Logo
  static const String appLogo = "assets/pictures/logo/logo.png";

  // -- Onboarding
  static const String onboarding1 = "assets/pictures/onboarding/onboarding_1.png";
  static const String onboarding2 = "assets/pictures/onboarding/onboarding_2.png";
  static const String onboarding3 = "assets/pictures/onboarding/onboarding_3.png";

  // -- Amount icons
  static List<Map<String, dynamic>> iconsData(BuildContext context) {
    return [
      {
        "title": AppLocalizations.of(context).money,
        "items": [
          "assets/pictures/amounts_types/money1.png",
          "assets/pictures/amounts_types/money2.png",
          "assets/pictures/amounts_types/money3.png",
          "assets/pictures/amounts_types/money4.png",
          "assets/pictures/amounts_types/money5.png",
          "assets/pictures/amounts_types/money6.png",
          "assets/pictures/amounts_types/money7.png",
          "assets/pictures/amounts_types/money8.png",
        ],
      },
      {
        "title": AppLocalizations.of(context).gift,
        "items": [
          "assets/pictures/amounts_types/gift1.png",
          "assets/pictures/amounts_types/gift2.png",
        ],
      },
      {
        "title": AppLocalizations.of(context).chart,
        "items": [
          "assets/pictures/amounts_types/chart1.png",
          "assets/pictures/amounts_types/chart2.png",
          "assets/pictures/amounts_types/chart3.png",
        ],
      },
      {
        "title": AppLocalizations.of(context).property,
        "items": [
          "assets/pictures/amounts_types/property1.png",
          "assets/pictures/amounts_types/property2.png",
          "assets/pictures/amounts_types/property3.png",
        ],
      },
      {
        "title": AppLocalizations.of(context).loyalty,
        "items": [
          "assets/pictures/amounts_types/loyalty1.png",
          "assets/pictures/amounts_types/loyalty2.png",
          "assets/pictures/amounts_types/loyalty3.png",
          "assets/pictures/amounts_types/loyalty4.png",
          "assets/pictures/amounts_types/loyalty5.png",
        ],
      },
    ];
  }
}
