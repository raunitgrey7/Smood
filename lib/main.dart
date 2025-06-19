import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'questions.dart';

void main() {
  runApp(SmoodApp());
}

class SmoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smood',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MoodFormScreen(),
    );
  }
}

class MoodFormScreen extends StatefulWidget {
  @override
  _MoodFormScreenState createState() => _MoodFormScreenState();
}

class _MoodFormScreenState extends State<MoodFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  String result = '';

  Future<void> sendFormData() async {
    final url = Uri.parse('http://10.0.2.2:8000/predict/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(_formData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        result = data['prediction'];
      });
    } else {
      setState(() {
        result = 'Prediction failed.';
      });
    }
  }

  Widget buildQuestionField(Map<String, dynamic> question) {
    if (question['type'] == 'dropdown') {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: question['question']),
        items:
            (question['options'] as List<String>)
                .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
                .toList(),
        onChanged: (val) {
          setState(() {
            _formData[question['key']] = val;
          });
        },
      );
    } else {
      return TextFormField(
        decoration: InputDecoration(labelText: question['question']),
        onChanged: (val) => _formData[question['key']] = val,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smood Form')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ...moodQuestions.map((q) => buildQuestionField(q)).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendFormData();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text(
                'Prediction: $result',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
