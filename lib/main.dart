import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const GoogleFontsDemoApp());
}

class GoogleFontsDemoApp extends StatelessWidget {
  const GoogleFontsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Fonts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FontDemoScreen(),
    );
  }
}

class FontDemoScreen extends StatefulWidget {
  const FontDemoScreen({super.key});

  @override
  FontDemoScreenState createState() => FontDemoScreenState();
}

class FontDemoScreenState extends State<FontDemoScreen> {
  String selectedFont = 'Roboto';

  final List<String> fonts = [
    'Roboto',
    'Lobster',
    'Pacifico',
    'Oswald',
    'Dancing Script',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Fonts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package description
            Text(
              'Package: google_fonts\n'
                  'Change the font!',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Display text in the selected font
            Text(
              'Hello, Flutter!',
              style: GoogleFonts.getFont(selectedFont, fontSize: 36),
            ),
            const SizedBox(height: 20),

            // Dropdown to select font
            DropdownButton<String>(
              value: selectedFont,
              items: fonts.map((font) {
                return DropdownMenuItem<String>(
                  value: font,
                  child: Text(font),
                );
              }).toList(),
              onChanged: (font) {
                setState(() {
                  selectedFont = font!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
