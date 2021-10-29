import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  CalcApp createState() => CalcApp();
}

class CalcApp extends State<App> {
  String _history = '';
  dynamic _expression = '';

  void numClick(dynamic text) {
    setState(() => _expression += text);
  }

  void numClick2(String text) {
    setState(() => _expression += '*');
  }

  void numClick3(String text) {
    setState(() => _expression += '/');
  }

  void numClick4(String text) {
    setState(() => _expression += '.');
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      if (text != null && text.length > 0) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  void square() {
    double a = double.parse(_expression);
    double b = sqrt(a);
    setState(() {
      _expression = '$b';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 70, 0, 0),
                child: Text(
                  'Standard',
                  style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 224, 223, 230),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Container(
            height: 163,
            width: 400,
            margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              color: Color.fromARGB(255, 33, 32, 83),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: _expression,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                                color: Color.fromARGB(255, 133, 195, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      allClear('C');
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 4, 2, 0),
                      child: Text(
                        'C',
                        style: TextStyle(
                            color: Color.fromARGB(255, 57, 56, 141),
                            fontSize: 30,
                            fontFamily: 'Buckin',
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 26, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 57, 56, 141))))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('%');
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 2, 0),
                        child: Text(
                          '%',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 57, 56, 141)),
                        )),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 26, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 57, 56, 141))))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      clear(_expression);
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0, 4, 2, 0),
                        child: Icon(
                          Icons.backspace,
                          color: Color.fromARGB(255, 57, 56, 141),
                        )),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 26, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 57, 56, 141))))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick3('/');
                    },
                    child: Text(
                      '÷',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat'),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 91, 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('7');
                    },
                    child: Text(
                      '7',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('8');
                    },
                    child: Text(
                      '8',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('9');
                    },
                    child: Text(
                      '9',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick2('*');
                    },
                    child: Icon(
                      Icons.clear,
                      size: 23,
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 91, 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('4');
                    },
                    child: Text(
                      '4',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('5');
                    },
                    child: Text(
                      '5',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('6');
                    },
                    child: Text(
                      '6',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        numClick('-');
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '_',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(12),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 227, 91, 0)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('1');
                    },
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('2');
                    },
                    child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('3');
                    },
                    child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('+');
                    },
                    child: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 91, 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      square();
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 2, 0),
                        child: Icon(
                          FontAwesomeIcons.squareRootAlt,
                          color: Color.fromARGB(255, 57, 56, 141),
                        )),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 26, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 57, 56, 141))))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('0');
                    },
                    child: Text(
                      '0',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 103, 101, 200)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      numClick('.');
                    },
                    child: Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 57, 56, 141)),
                        )),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 26, 70)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 57, 56, 141))))),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      evaluate('=');
                    },
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 133, 195, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 26, 26, 70),
    );
  }
}
