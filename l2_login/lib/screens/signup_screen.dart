import 'package:flutter/material.dart';
import 'package:l2_login/widgets/custom_input.dart';
import 'package:l2_login/widgets/social_media_card.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                splashRadius: 20,
                color: const Color(0XFF20309F),
              ),
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
              'Create your Account',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(name: 'Email'),
            const CustomInput(name: 'Password'),
            const CustomInput(name: 'Confirm Password'),
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
              child: const Text('Sign up'),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '- Or sign up with -',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const SocialMediaCard(),
          ],
        ),
      ),
    );
  }
}
