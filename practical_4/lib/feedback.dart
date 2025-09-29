//SUpplymentry Question Feedback Screen

import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _gender;
  int? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Gender'),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text('Male'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        int? age = int.tryParse(value);
                        if (age == null || age <= 0) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length != 10) {
                          return 'Phone number must be 10 digits';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Rating'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        int value = index + 1;
                        return Row(
                          children: [
                            Radio<int>(
                              value: value,
                              groupValue: _ratingValue,
                              onChanged: (val) {
                                setState(() {
                                  _ratingValue = val;
                                });
                              },
                            ),
                            Text('$value'),
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Thank you for your feedback!'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
