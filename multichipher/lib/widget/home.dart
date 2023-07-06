import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              'Welcome to Multichipher',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF407BFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Cryptography',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cryptography is the study of secure communications techniques that allow only the sender and intended recipient of a message to view its contents. The term is derived from the Greek word kryptos, which means hidden.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF407BFF),
            ),
            child: Text(
              'Ancient Egyptians were known to use these methods in complex hieroglyphics, and Roman Emperor Julius Caesar is credited with using one of the first modern ciphers.\nWhen transmitting electronic data, the most common use of cryptography is to encrypt and decrypt email and other plain-text messages.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
