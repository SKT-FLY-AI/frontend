// login_screen.dart
import 'package:flutter/cupertino.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Join-Login'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoTextField(
                placeholder: 'Username',
                prefix: Icon(CupertinoIcons.person),
              ),
              const SizedBox(height: 16),
              const CupertinoTextField(
                placeholder: 'Password',
                obscureText: true,
                prefix: Icon(CupertinoIcons.padlock),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text('LOGIN'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
