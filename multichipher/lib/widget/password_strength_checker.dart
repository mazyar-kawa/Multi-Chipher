import 'package:flutter/material.dart';

class PasswordStrength extends StatefulWidget {
  const PasswordStrength({Key? key}) : super(key: key);

  @override
  State<PasswordStrength> createState() => _PasswordStrengthState();
}

class _PasswordStrengthState extends State<PasswordStrength> {
  double strength = 0.0;
  late String password = '';
  RegExp number = RegExp(r'.*[0-9].*');
  RegExp letter = RegExp(r'.*[A-Za-z].*');
  RegExp special = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  String display = "Please enter a password";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/password_checker.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                check(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter a password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              value: strength,
              backgroundColor: Colors.grey,
              color: strength <= 1 / 4
                  ? Colors.red
                  : strength <= 2 / 4
                      ? Colors.orange
                      : strength <= 3 / 4
                          ? Colors.yellow
                          : Colors.green,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              display,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void check(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        strength = 0.0;
        display = "Please enter a password";
      });
    } else if (password.length < 6) {
      setState(() {
        strength = 1 / 4;
        display = "your password is too short";
      });
    } else if (password.length < 8) {
      setState(() {
        strength = 2 / 4;
        display = "your password acceptable but not strong";
      });
    } else {
      if (number.hasMatch(password) &&
          letter.hasMatch(password) &&
          special.hasMatch(password)) {
        setState(() {
          strength = 1.0;
          display = "your password is very strong";
        });
      } else if (number.hasMatch(password) && letter.hasMatch(password)) {
        setState(() {
          strength = 3 / 4;
          display = "your password is strong";
        });
      }
    }
  }
}
