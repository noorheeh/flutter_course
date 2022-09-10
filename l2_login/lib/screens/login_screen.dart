import 'package:flutter/material.dart';
import 'package:l2_login/screens/signup_screen.dart';
import 'package:l2_login/widgets/custom_input.dart';
import 'package:l2_login/widgets/social_media_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              alignment: Alignment.center,
              child: Image.network(
                  'https://pbs.twimg.com/profile_images/956201005028466689/dt2Qi9Ze_400x400.jpg'),
            ),
            Text(
              'Login to your Account',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(name: 'Email'),
            const CustomInput(name: 'Password'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color(0XFF20309F),
                minimumSize: const Size(double.infinity, 60),
                shadowColor: Colors.blue.shade200,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Sign in'),
            ),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '- Or sign in with -',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const SocialMediaCard(),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0XFF6D74A4),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
