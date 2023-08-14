import 'package:aibspartenairemobile/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AibsWelcomeForLogin extends StatelessWidget {
  const AibsWelcomeForLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/logo_aibs.svg',
                      width: 140,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'votre espace partenaires',
                      style: TextStyle(
                        color: Color(0xFF00082B),
                        fontSize: 19,
                        fontFamily: 'Roboto',
                        letterSpacing: 2.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: SizedBox(
                width: 220,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00082B),
                    padding: EdgeInsets.fromLTRB(30, 0, 12, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Se connecter',
                        style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Segoe', letterSpacing: 1.5),
                      ),
                      SvgPicture.asset(
                        'assets/go_login.svg',
                        width: 40,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
