import 'package:flutter/material.dart';

void main() {
  runApp(PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: StreamingPasswordsPage(),
    );
  }
}

class StreamingPasswordsPage extends StatefulWidget {
  @override
  _StreamingPasswordsPageState createState() => _StreamingPasswordsPageState();
}

class _StreamingPasswordsPageState extends State<StreamingPasswordsPage> {
  String _selectedService = '';
  String _email = '';
  String _password = '';

  final Map<String, Map<String, String>> _passwords = {
    'MAX': {'email': 'max@example.com', 'password': 'max1234'},
    'Netflix': {'email': 'netflix@example.com', 'password': 'netflix5678'},
    'Prime Video': {'email': 'prime@example.com', 'password': 'prime1234'},
    'Disney+': {'email': 'disney@example.com', 'password': 'disney5678'},
    'Paramount+':{'email': 'paramount@example.com', 'password': 'paramountplus9876'}
  };

  void _selectService(String service) {
    setState(() {
      _selectedService = service;
      _email = _passwords[service]!['email']!;
      _password = _passwords[service]!['password']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/imagefamily.jpg', // Use your actual image path here
              fit: BoxFit.cover,
            ),
          ),

          // Main content container with dark grey background
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9), // Dark grey background for container
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title above the image
                  Text(
                    'Streaming Login Manager',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),
                  // The image above the buttons
                  Image.asset(
                    'assets/imageplayer.jpg', // Replace with your image path
                    height: 200,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: 20),

                  // Buttons
                  Wrap(
                    alignment: WrapAlignment.center, // Ensure the buttons are centered
                    spacing: 10, // Horizontal space between buttons
                    runSpacing: 10, // Vertical space between buttons (if wrapped)
                    children: [
                      _buildServiceButton('MAX', Colors.purple),
                      _buildServiceButton('Paramount+', Color.fromARGB(255, 15, 81, 148)), // New blue color for Paramount+
                      _buildServiceButton('Netflix', Colors.red),
                      _buildServiceButton('Prime Video', Colors.orange),
                      _buildServiceButton('Disney+', Colors.blue),
                    ],
                  ),

                  SizedBox(height: 20), // Space between buttons and the divider

                  // White divider line (reduced length)
                  Container(
                    height: 2, // Thin line
                    width: 800, // Reduced width to make the line shorter
                    color: Colors.white, // Line color
                    margin: EdgeInsets.symmetric(vertical: 10), // Margin for some space around the line
                  ),

                  SizedBox(height: 20), // Space between divider and content

                  // Display selected email and password
                  if (_selectedService.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          '$_selectedService Credentials',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email: $_email',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          'Password: $_password',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(String service, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, // Text color set to white
        padding: EdgeInsets.all(24.0), // Button size
        textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
      ),
      onPressed: () => _selectService(service),
      child: Text(service),
    );
  }
}
