import 'package:flutter/material.dart';

const shadowColor = Color.fromARGB(255, 117, 117, 57);

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _value = '';
  double? _num1;
  String? _operator;
  bool _operationCompleted = false;

  void _calcular() {
    double num2 = double.parse(_value);
    double result;
    _operationCompleted = true;
    if (_operator == '+') {
      result = _num1! + num2;
    } else if (_operator == '-') {
      result = _num1! - num2;
    } else if (_operator == '*') {
      result = _num1! * num2;
    } else if (_operator == '/' && num2 != 0) {
      result = _num1! / num2;
    } else {
      setState(() {
        _value = "Error / 0";
      });
      return; // Exit the method
    }

    setState(() {
      _value = result.toString();
      _num1 = null;
      _operator = null;
      _operationCompleted = true;
    }); // Reset the flag after calculating.
  }

  void _presionarNumero(String valor) {
    setState(() {
      if (valor == '.' && _value.contains('.')) {
        return; // Do not add more decimal points
      }
      if (_operationCompleted) {
        // If an operation was performed, replace the value.
        _value = valor;
        _operationCompleted = false; // Reset the flag after replacing
      } else {
        _value += valor;
      }
    });
  }

  void _presionarOperador(String operador) {
    setState(() {
      _num1 = double.parse(_value);
      _operator = operador;
      _value = '';
    });
  }

  void _reset() {
    setState(() {
      _value = '';
      _num1 = null;
      _operator = null;
      _operationCompleted = false; // Restablecer la bandera al reiniciar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Simple Calculator",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 4.0,
                  color: shadowColor,
                ),
              ]),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 46, 45, 45),
            height: 10,
            width: double.infinity,
          ),
          Container(
            color: const Color.fromARGB(255, 46, 45, 45),
            height: 100,
            width: double.infinity,
            child: Center(
              child: Container(
                color: Colors.grey[300],
                height: 70,
                width: 380,
                child: Center(
                  child: Text(_value,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 46, 45, 45),
            height: 30,
            width: double.infinity,
          ),
          Container(
            color: const Color.fromARGB(255, 46, 45, 45),
            height: 645,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 55.0,
                  crossAxisSpacing: 15.0,
                  children: [
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('1'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('2'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('3'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarOperador('/'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Center(
                          child: Text(
                            "/",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-----------------------------------------------------------
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('4'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('5'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('6'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarOperador('*'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Center(
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('7'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "7",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('8'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('9'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "9",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarOperador('-'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //---------------------------------------------------------
                    //---------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('0'),
                      child: Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarNumero('.'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Center(
                          child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //----------------------------------------------------------
                    GestureDetector(
                      onTap: _calcular,
                      onLongPress: _reset,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color.fromARGB(255, 242, 255, 0),
                              child: const Center(
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 46,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors
                                .black, // Change the color of the line as desired
                            thickness: 2.0, // Adjust the thickness of the line
                            height: 1.0, // Adjust the height of the line
                          ),
                          Container(
                            color: Color.fromARGB(255, 242, 255, 0),
                            child: const Center(
                              child: Text(
                                'long press to reset',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //-----------------------------------------------------------
                    GestureDetector(
                      onTap: () => _presionarOperador('+'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //---------------------------------------------------------
                    //---------------------------------------------------------
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
