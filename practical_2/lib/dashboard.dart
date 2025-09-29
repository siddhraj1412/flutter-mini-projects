import "package:flutter/material.dart";

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final TextEditingController _tempController = TextEditingController();
  String _result = '';
  bool _isCtoF = true;

  void _convert() {
    double? input = double.tryParse(_tempController.text);
    if (input == null) {
      setState(() {
        _result = 'Please enter a valid number';
      });
      return;
    }
    double output;
    if (_isCtoF) {
      output = (input * 9 / 5) + 32;
      _result = '$input °C = ${output.toStringAsFixed(2)} °F';
    } else {
      output = (input - 32) * 5 / 9;
      _result = '$input °F = ${output.toStringAsFixed(2)} °C';
    }
    setState(() {});
  }



  @override

  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userName = args?['name'] ?? 'User';


    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hi $userName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Welcome $userName')));
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: {
                      'name': userName,
                      'email': args?['email'] ?? 'No Email',
                    },
                  );
                },
                child: const Text('Go to Profile'),
              ),

              const SizedBox(height: 40),
              const Text(
                'Temperature Converter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  controller: _tempController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter temperature',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Celsius to Fahrenheit'),
                  Switch(
                    value: _isCtoF,
                    onChanged: (val) {
                      setState(() {
                        _isCtoF = val;
                      });
                    },
                  ),

                  const Text('Fahrenheit to Celsius'),
                ],
              ),


              ElevatedButton(onPressed: _convert, child: const Text('Convert')),
              const SizedBox(height: 16),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
