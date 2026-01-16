import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/screens/profile_card_rating.dart';

import '../components/contact_info.dart';
import '../components/profile_card.dart';
import '../components/rating.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return ProfileCardRating();
        } else {
          return Scaffold(
            body: Padding(
              padding: EdgeInsetsGeometry.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileCard(
                    img:
                        'https://contentful.harrypotter.com/usf1vwtuqyxm/6fjvdemYmo7kJ2V5P5Xqhc/1fc2b0b396123f891e858069e00d0d2b/hp-f6-harry-at-great-hall-table-web-fact-file-image.jpg',
                    name: 'Harry Potter',
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                          child: ContactInfo(
                            location: 'Anns Place',
                            addr: '123 Main St',
                            phone: '(081) 986-2164',
                            email: 'ann@email.com',
                          ),
                        ),
                        Rating(
                          rate: 4,
                          defaultColor: Colors.grey,
                          ratingColor: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
