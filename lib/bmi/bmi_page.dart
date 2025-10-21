import 'package:bmi_calculate_app/bmi/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bmi_details_page.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final _formKey = GlobalKey<FormState>();
  final _wightController = TextEditingController();
  final _heightController = TextEditingController();

  void _calculateBmi() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final _weight = _wightController.text;
      final _height = _heightController.text;

      context.read<BmiProvider>().calculateBmi(_weight, _height);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _wightController,
                    decoration: InputDecoration(
                      labelText: 'Your Weigth (in K.G)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a valid weigth';
                      }
                      if (double.parse(value) <= 0) {
                        return 'weigth cannot be lessthen or equal 0';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _heightController,
                    decoration: InputDecoration(
                      labelText: 'Your Height (in meter)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide a valid height';
                      }
                      if (double.parse(value) <= 1) {
                        return 'height cannot be lessthen 1';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade500,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                        ),
                      ),
                      onPressed: _calculateBmi,
                      child: Text('Calculate'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Consumer<BmiProvider>(
                    builder: (ctx, provider, _) => Text(
                      'Your BMI: ${provider.bmi.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You Are in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Consumer<BmiProvider>(
                    builder: (ctx, provider, _) => Text(
                      provider.bmiStatus,
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade500,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiDetailsPage()));
                },
                child: Text('View Details'),
              ),
            ),
            SizedBox(height: 21.0),
          ],
        ),
      ),
    );
  }
}
