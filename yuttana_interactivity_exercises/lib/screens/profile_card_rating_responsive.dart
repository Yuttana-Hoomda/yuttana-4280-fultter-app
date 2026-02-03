import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/components/interactive_ratings.dart';
import 'package:yuttana_widgets_exercises/components/contact_info.dart';
import 'package:yuttana_widgets_exercises/components/profile_card.dart';
import 'package:yuttana_widgets_exercises/utils/responsive.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Responsive.isPortrait(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileCard(
                      img:
                          'https://upload.wikimedia.org/wikipedia/commons/3/3c/Tom_Holland_by_Gage_Skidmore.jpg',
                      name: 'Tom Holland',
                    ),
                    const SizedBox(height: 28),
                    ContactInfo(
                      location: 'KhonKaen University',
                      addr: 'KhonKaen, Thailand 4000',
                      phone: '098 123 4567',
                      email: 'celeb@gmail.com',
                    ),
                    const SizedBox(height: 28),
                    InteractiveRatings(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileCard(
                        img:
                            'https://upload.wikimedia.org/wikipedia/commons/3/3c/Tom_Holland_by_Gage_Skidmore.jpg',
                        name: 'Tom Holland',
                      ),
                    const SizedBox(width: 24,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ContactInfo(
                            location: 'KhonKaen University',
                            addr: 'KhonKaen, Thailand 4000',
                            phone: '098 123 4567',
                            email: 'celeb@gmail.com',
                          ),
                          const SizedBox(height: 28),
                          InteractiveRatings(),
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
