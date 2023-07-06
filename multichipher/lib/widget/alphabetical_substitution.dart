import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class AlphabeticalSubstitution extends StatefulWidget {
  const AlphabeticalSubstitution({Key? key}) : super(key: key);

  @override
  State<AlphabeticalSubstitution> createState() =>
      _AlphabeticalSubstitutionState();
}

List normal_letter = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

List char_letter = [
  'z',
  'y',
  'x',
  'w',
  'v',
  'u',
  't',
  's',
  'r',
  'q',
  'p',
  'o',
  'n',
  'm',
  'l',
  'k',
  'j',
  'i',
  'h',
  'g',
  'f',
  'e',
  'd',
  'c',
  'b',
  'a'
];

class _AlphabeticalSubstitutionState extends State<AlphabeticalSubstitution> {
  final TextEditingController messageController = TextEditingController();
  late String result;
  bool isDone = false;

  String encryption(String text) {
    String encrypted = '';
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        encrypted += ' ';
      } else {
        int index = normal_letter.indexOf(text[i]);
        encrypted += char_letter[index];
      }
    }
    result = encrypted;
    return result;
  }

  String decription(String text) {
    String decrypted = '';
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        decrypted += ' ';
      } else {
        int index = char_letter.indexOf(text[i]);
        decrypted += normal_letter[index];
      }
    }
    result = decrypted;
    return result;
  }

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
                padding: EdgeInsets.only(bottom: 12),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
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
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF407BFF),
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: Center(
                          child: Text(
                        'Encryption',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      setState(() {
                        encryption(messageController.text.toLowerCase());
                        isDone = true;
                      });
                    },
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
                        'Dcryption',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      setState(() {
                        decription(messageController.text.toLowerCase());
                        isDone = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
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
                    'Clear',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                onTap: () {
                  setState(() {
                    messageController.text = '';
                    isDone = false;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF407BFF),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Alphabetical Substitute Info:',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'A mono-alphabetic cipher (aka simple substitution cipher) is a substitution cipher where each letter of the plain text is replaced with another letter of the alphabet.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
