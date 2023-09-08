import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double fahrenheit = 0;
  double celsius = 0;

  void convertToFahrenheit(double celsius) {
    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  void convertToCelsius(double fahrenheit) {
    setState(() {
      celsius = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Celsius'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double inputValue = double.parse(value);
                  convertToFahrenheit(inputValue);
                } else {
                  setState(() {
                    fahrenheit = 0;
                  });
                }
              },
            ),
            Text('Fahrenheit: $fahrenheit°F'),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Fahrenheit'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double inputValue = double.parse(value);
                  convertToCelsius(inputValue);
                } else {
                  setState(() {
                    celsius = 0;
                  });
                }
              },
            ),
            Text('Celsius: $celsius°C'),
          ],
        ),
      ),
    );
  }
}
