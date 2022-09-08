import 'package:flutter/material.dart';
import 'package:l2/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIconColor: Colors.white,
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Enter your email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.purple.shade200,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Remember me'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade200,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20.0)),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not registerd yet?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Colors.purple.shade200),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
