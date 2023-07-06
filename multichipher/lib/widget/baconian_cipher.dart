import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class BaconianChipher extends StatefulWidget {
  const BaconianChipher({Key? key}) : super(key: key);

  @override
  State<BaconianChipher> createState() => _BaconianChipherState();
}

Map<String, dynamic> lookup = {
  'A': 'aaaaa',
  'B': 'aaaab',
  'C': 'aaaba',
  'D': 'aaabb',
  'E': 'aabaa',
  'F': 'aabab',
  'G': 'aabba',
  'H': 'aabbb',
  'I': 'abaaa',
  'J': 'abaab',
  'K': 'ababa',
  'L': 'ababb',
  'M': 'abbaa',
  'N': 'abbab',
  'O': 'abbba',
  'P': 'abbbb',
  'Q': 'baaaa',
  'R': 'baaab',
  'S': 'baaba',
  'T': 'baabb',
  'U': 'babaa',
  'V': 'babab',
  'W': 'babba',
  'X': 'babbb',
  'Y': 'bbaaa',
  'Z': 'bbaab'
};

class _BaconianChipherState extends State<BaconianChipher> {
  final TextEditingController messageController = TextEditingController();
  late String result;
  bool isDone = false;
  String encrypt(String text) {
    String encrypted = '';
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        encrypted += ' ';
      } else {
        encrypted += lookup[text[i]];
      }
    }
    result = encrypted;
    return result;
  }

  String decryption(String text) {
    String decrypted = '';
    int i = 0;
    while (true) {
      if (i == text.length) {
        break;
      }
      if (text[i] == ' ') {
        decrypted += ' ';
        i++;
      } else {
        for (var x in lookup.keys) {
          if (lookup[x] == text.substring(i, i + 5)) {
            decrypted += x;
            i += 5;
            break;
          }
        }
      }
    }
    result = decrypted;
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
                        encrypt(messageController.text.toUpperCase());
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
                        decryption(messageController.text);
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
              height: MediaQuery.of(context).size.height * 0.45,
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
                      child: Text('Baconian Cipher Info:',style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Bitonic Sort is a classic parallel algorithm for sorting.\n-Bitonic sort does O(n Log 2n) comparisons.\n-The number of comparisons done by Bitonic sort are more than popular sorting algorithms like Merge Sort [ does O(nLogn) comparisons], but Bitonice sort is better for parallel implementation because we always compare elements in predefined sequence and the sequence of comparison doesn’t depend on data. Therefore it is suitable for implementation in hardware and parallel processor array.\n-Bitonic Sort must be done if number of elements to sort are 2^n. The procedure of bitonic sequence fails if the number of elements are not in the aforementioned quantity precisely.',
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
