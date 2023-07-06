import 'package:flutter/material.dart';
import 'package:multichipher/widget/alphabetical_substitution.dart';
import 'package:multichipher/widget/caesar_cipher.dart';
import 'package:multichipher/widget/home.dart';
import 'package:multichipher/widget/password_genarator.dart';
import 'package:multichipher/widget/password_strength_checker.dart';
import 'widget/baconian_cipher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

var _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeAppState extends State<HomeApp> {
  var currentPage = DrawerSection.Home;
  var titlebar;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSection.Home) {
      container = Home();
      titlebar = 'Home';
    } else if (currentPage == DrawerSection.Caesar_chiper) {
      container = CaesarChipher();
      titlebar = 'Caesar chiper';
    } else if (currentPage == DrawerSection.Baconian_chiper) {
      container = BaconianChipher();
      titlebar = 'Baconian chiper';
    } else if (currentPage == DrawerSection.Alphabetical_substitution_cipher) {
      container = AlphabeticalSubstitution();
      titlebar = 'Alphabetical Substitution Cipher';
    } else if (currentPage == DrawerSection.password_genarator) {
      container = PasswordGenarator();
      titlebar = 'Password Genarator';
    } else if (currentPage == DrawerSection.password_strength) {
      container = PasswordStrength();
      titlebar = 'Password Strength Checker';
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyDrawerHead(),
                MydrawerList(),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titlebar.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: container,
    );
  }

  Widget MyDrawerHead() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
              color: Color(0xFF407BFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF407BFF),
              child: Image(
                image: AssetImage('assets/image/icon.png'),
                width: 50,
                height: 50,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 90,
            child: Text(
              'Multichipher',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget MydrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          menuItem(
            1,
            'Home',
            currentPage == DrawerSection.Home ? true : false,
          ),
          menuItem(
            2,
            'Caesar Cipher',
            currentPage == DrawerSection.Caesar_chiper ? true : false,
          ),
          menuItem(
            3,
            'Baconian Cipher',
            currentPage == DrawerSection.Baconian_chiper ? true : false,
          ),
          menuItem(
            4,
            'Alphabetical Substitution Cipher',
            currentPage == DrawerSection.Alphabetical_substitution_cipher
                ? true
                : false,
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          menuItem(
            5,
            'Password Generator',
            currentPage == DrawerSection.password_genarator ? true : false,
          ),
          menuItem(
            6,
            'Password Strength Checker',
            currentPage == DrawerSection.password_strength ? true : false,
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      child: ListTile(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.Home;
            }
            if (id == 2) {
              currentPage = DrawerSection.Caesar_chiper;
            }
            if (id == 3) {
              currentPage = DrawerSection.Baconian_chiper;
            }
            if (id == 4) {
              currentPage = DrawerSection.Alphabetical_substitution_cipher;
            }
            if (id == 5) {
              currentPage = DrawerSection.password_genarator;
            }
            if (id == 6) {
              currentPage = DrawerSection.password_strength;
            }
          });
        },
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Color(0xFF407BFF) : Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  Home,
  Caesar_chiper,
  Baconian_chiper,
  Alphabetical_substitution_cipher,
  password_genarator,
  password_strength,
}
