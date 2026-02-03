import 'package:flutter/material.dart';
import '../components/custom_text.dart';
import '../models/contact_model.dart';

final List<Contact> _contacts = [
  Contact(name: "John Doe", phoneNumber: "123-456-7890"),
  Contact(name: "Jane Smith", phoneNumber: "987-654-3210"),
  Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
];


class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();

}

class _ContactListScreenState extends State<ContactListScreen> {
  int _counter = 1;

  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $_counter",
          phoneNumber: "000-000-${_counter.toString().padLeft(4, '0')}",
        ),
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Contacts"),),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 1
                  )
                ]
              ),
              child: ListTile(
                title: CustomText(
                    fontSized: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    text: _contacts[index].name
                ),
                trailing: CustomText(
                    fontSized: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    text: _contacts[index].phoneNumber
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 14,),
          itemCount: _contacts.length
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _addContact(),
        child: Icon(Icons.add)
      ),
    );
  }
}
