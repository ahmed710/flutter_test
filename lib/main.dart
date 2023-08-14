import 'package:aibspartenairemobile/screens/AibsWelcomeForLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AibsPartenaire',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> logoAssets = [
    'assets/logo_3_whites.svg',
    'assets/logo_1_whites.svg',
    'assets/logo_2_whites.svg',
    'assets/logo_0_whites.svg',
  ];

  int _currentLogoIndex = 0;
  int _iterationCount = 0;
  int _maxIterations = 3; // Set the number of times you want to show the elements

  void _changeLogo() {
    setState(() {
      _currentLogoIndex = (_currentLogoIndex + 1) % logoAssets.length;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _changeLogo();
      _startLogoAnimation();
    });
  }

  void _startLogoAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (_currentLogoIndex == logoAssets.length - 1) {
        _iterationCount++;
        if (_iterationCount == _maxIterations) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AibsWelcomeForLogin(),
            ),
          );
        } else {
          // Reset logo index and continue the animation
          _currentLogoIndex = 0;
          _startLogoAnimation();
        }
      } else {
        _changeLogo();
        _startLogoAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00082B),
      body: Center(
        child: SvgPicture.asset(
          logoAssets[_currentLogoIndex],
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
