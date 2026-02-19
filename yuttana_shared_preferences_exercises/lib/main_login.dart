import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void _showSnackBar(BuildContext context, String userName, String password) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Saved -> username: $userName, password: $password'),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'userName', 'password'},
    ),
  );

  runApp(MainLogin(prefs: prefs));
}

class MainLogin extends StatefulWidget {
  const MainLogin({super.key, required this.prefs});

  final SharedPreferencesWithCache prefs;

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userName = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _userName = widget.prefs.getString('userName') ?? 'No UserName Saved';
    _password = widget.prefs.getString('password') ?? 'No Password Saved';

    _userNameController.text = _userName;
    _passwordController.text = _password;
  }

  Future<void> _handleLogin(String userName, String password) async {
    await widget.prefs.setString('userName', userName);
    await widget.prefs.setString('password', password);

    setState(() {
      _userName = userName;
      _password = password;
    });

    debugPrint('Saved -> username: $userName, password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Using Shared Preferences with Cache'),
          centerTitle: true,
        ),
        body: Builder(
            builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _userNameController,
                        decoration: const InputDecoration(labelText: 'UserName'),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'Password'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _handleLogin(
                            _userNameController.text,
                            _passwordController.text,
                          );
                          _showSnackBar(
                            context,
                            _userNameController.text,
                            _passwordController.text,
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              );
            }
        )
      ),
    );
  }
}
