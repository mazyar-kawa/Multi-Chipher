import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class PasswordGenarator extends StatefulWidget {
  @override
  State<PasswordGenarator> createState() => _PasswordGenaratorState();
}

class _PasswordGenaratorState extends State<PasswordGenarator> {
  final TextEditingController sizeController = TextEditingController();
  String result = '';
  bool isDone = false;

  String passwordgenarator(int size) {
    String uppr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String lowr = "abcdefghijklmnopqrstuvwxyz";
    String numr = "0123456789";
    String symr = "!@#%\$^&*()_+-=[]{}|;':,./<>?";
    String pass = "";
    String combination = uppr + lowr + numr + symr;
    Random random = new Random();
    for (var i = 0; i < size; i++) {
      pass += combination[random.nextInt(combination.length)];
    }
    result = pass;
    return result;
  }

  List all = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/password_genarator.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextField(
                controller: sizeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter the size of password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF407BFF),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  child: Center(
                      child: Text(
                    'Generate',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                onTap: () {
                  setState(() {
                    passwordgenarator(sizeController.text.toString().length > 0
                        ? int.parse(sizeController.text.toString())
                        : 0);
                    isDone = true;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(bottom: 10),
                      child: isDone
                          ? SingleChildScrollView(
                              child: Text(
                                'Result: $result',
                              ),
                            )
                          : Text('Result:')),
                  Container(
                    child: IconButton(
                      onPressed: () async {
                        await FlutterClipboard.copy(result);
                      },
                      icon: Icon(Icons.copy),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
