import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuttana_shared_preferences_exercises/components/interactive_star.dart';
import 'package:yuttana_widgets_exercises/components/contact_info.dart';
import 'package:yuttana_widgets_exercises/components/profile_card.dart';
import 'package:yuttana_widgets_exercises/utils/responsive.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key, required this.prefs});

  final SharedPreferencesWithCache prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Responsive.isPortrait(context)
              ? Column(
                  children: [
                    ProfileCard(
                      img:
                          'https://media.cnn.com/api/v1/images/stellar/prod/221117101638-anya-taylor-joy-0405-restricted.jpg?c=16x9&q=h_833,w_1480,c_fill',
                      name: 'anya taylor-joy',
                    ),
                    const SizedBox(height: 28),
                    ContactInfo(
                      location: 'England',
                      addr: '11/12 prevt Rd.',
                      phone: '0987654321',
                      email: 'test@gmail.com',
                    ),
                    const SizedBox(height: 28),
                    InteractiveStar(prefs: prefs),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileCard(
                      img:
                          'https://media.cnn.com/api/v1/images/stellar/prod/221117101638-anya-taylor-joy-0405-restricted.jpg?c=16x9&q=h_833,w_1480,c_fill',
                      name: 'anya taylor-joy',
                    ),
                    const SizedBox(width: 28),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ContactInfo(
                            location: 'England',
                            addr: '11/12 prevt Rd.',
                            phone: '0987654321',
                            email: 'test@gmail.com',
                          ),
                          const SizedBox(height: 28),
                          InteractiveStar(prefs: prefs),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
