/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-12
/// this lab will show the tex display name and company via terminal by using future for fetch api
/// this lab focus on using future to fetch data then access data as json
/// and use Model of data for strict type and filed of json data
/// then use RichText for display different color of text inline
/// use Gemini Ai for solving Validation text error
///   prompt: copy the code of textFormField for gemini, how to make form show error text
///   response: gemini recommend to create 'final _formKey = GlobalKey<FormState>();'
///       and wrap all input form inside Form widget that make it show error text automatic
///       that show the text that set in validate properties and and controller condition of save button
library;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yuttana_async_exercises/models/contact.dart';

void main() => runApp(MainContactsFiles());

class MainContactsFiles extends StatefulWidget {
  const MainContactsFiles({super.key});

  @override
  State<MainContactsFiles> createState() => _MainContactsFilesState();
}

class _MainContactsFilesState extends State<MainContactsFiles> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  List<Contact> _contactList = <Contact>[];

  @override
  void initState() {
    _loadContacts();
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/contacts.json');
  }

  Future<void> _loadContacts() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) return;

      final contents = await file.readAsString();
      setState(() {
        final List<dynamic> decodedData = jsonDecode(contents);
        _contactList = List<Contact>.from(
          decodedData.map((json) => Contact.fromJson(json)).toList(),
        );
      });
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  Future<void> _saveContact() async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(_contactList));

    debugPrint('Successfully saved contacts to: ${file.path}');
  }

  void _resetController() {
    _emailController.clear();
    _phoneController.clear();
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Contact Manager')),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _contactList.add(
                              Contact(
                                phone: _phoneController.text,
                                name: _nameController.text,
                                email: _emailController.text,
                              ),
                            );
                          });
                          _saveContact();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Save Contact Success'),
                            ),
                          );
                          _resetController();
                        }
                      },
                      child: const Text('Save Contact'),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: _contactList.length,
                        itemBuilder: (context, index) {
                          final contact = _contactList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contact.name),
                              Text(
                                contact.phone,
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                contact.email,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
