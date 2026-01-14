import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.location,
    required this.addr,
    required this.phone,
    required this.email
  });

  final String location;
  final String addr;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.apartment,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              location
            ),
            subtitle: Text(addr),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
                Icons.phone,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(phone),
          ),
          ListTile(
            leading: Icon(
                Icons.email,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(email),
          )
        ],
      ),
    );
  }
}
