import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/contact_info.dart';
import 'package:yuttana_4280_fultter_app/components/profile_card.dart';
import 'package:yuttana_4280_fultter_app/components/rating.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsetsGeometry.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileCard(
              img: 'https://contentful.harrypotter.com/usf1vwtuqyxm/6fjvdemYmo7kJ2V5P5Xqhc/1fc2b0b396123f891e858069e00d0d2b/hp-f6-harry-at-great-hall-table-web-fact-file-image.jpg',
              name: 'Harry Potter',),
            ContactInfo(
              location: 'Anns Place',
              addr: '123 Main St',
              phone: '(081) 986-2164',
              email: 'ann@email.com',
            ),
            Rating(
              rate: 4,
              defaultColor: Colors.grey,
              ratingColor: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      )
    );
  }
}
