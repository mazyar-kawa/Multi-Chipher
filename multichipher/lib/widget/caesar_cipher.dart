import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class CaesarChipher extends StatefulWidget {
  const CaesarChipher({Key? key}) : super(key: key);

  @override
  State<CaesarChipher> createState() => _CaesarChipherState();
}

List letter = [
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
  'z',
];

class _CaesarChipherState extends State<CaesarChipher> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  late String result;
  bool isDone = false;
  String encryption(String message, String keyy) {
    String s = "";
    int key = int.parse(keyy);
    for (int i = 0; i < message.length; i++) {
      for (int j = 0; j < letter.length; j++) {
        if (message[i] == ' ') {
          s += '';
          break;
        } else if (letter[j] == message[i]) {
          s += letter[(j + key) % 26];
        }
      }
    }
    result = s;
    return result;
  }

  String dencryption(String message, String keyy) {
    String s = "";
    int key = int.parse(keyy);
    for (int i = 0; i < message.length; i++) {
      for (int j = 0; j < letter.length; j++) {
        if (letter[j] == message[i]) {
          if (message[i] == ' ') {
            s += '';
            break;
          } else if ((j - key) < 0) {
            s += letter[(j - key) + 26];
          } else {
            s += letter[(j - key)];
          }
        }
      }
    }
    result = s;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: EdgeInsets.only(bottom: 12),
                child: TextField(
                  controller: keyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Key',
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
                    ),
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
                        encryption(messageController.text.toLowerCase(),
                            keyController.text);
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
                        dencryption(messageController.text.toLowerCase(),
                            keyController.text);
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
                    keyController.text = '';
                    isDone = false;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
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
                          'Ceasar Cipher Info:',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'The Caesar Cipher technique is one of the earliest and simplest method of encryption technique.\neach letter of a given text is replaced by a letter some fixed number of positions down the alphabet. For example with a shift of 1, A would be replaced by B, B would become C, and so on. The method is apparently named after Julius Caesar, who apparently used it to communicate with his officials.',
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
