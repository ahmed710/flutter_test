import 'package:aibspartenairemobile/screens/LoginScreen.dart';
import 'package:aibspartenairemobile/screens/auth-screens.structure.dart';
import 'package:aibspartenairemobile/screens/auth-screens.structure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Register extends StatelessWidget {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  Widget getCombinedText(String labelText) {
    TextSpan styledText = TextSpan(
      children: [
        TextSpan(
          text: '* ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: labelText,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFB2B2B2),
            fontFamily: 'Segoe',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

    return RichText(
      text: styledText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60),
                SvgPicture.asset(
                  'assets/logo_aibs.svg',
                  width: 83,
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'BIENVENUE',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00082B)),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '* ', // Add the asterisk here
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              // You can change the color as needed
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Nom et Prénom',
                            // Replace with your label text
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFB2B2B2),
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23,
                  child: FormBuilderTextField(
                    key: ValueKey('nom'),
                    name: 'nom',
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Color(0xFFB2B2B2),
                          fontFamily: 'Segoe',
                          fontWeight: FontWeight.w600),
                      fillColor: Color(0xFFB2B2B2),
                      focusColor: Color(0xFFB2B2B2),
                    ),
                    keyboardType: TextInputType.name,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: FormErrorStructure.nameError),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '* ', // Add the asterisk here
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.orange,
                                // You can change the color as needed
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Adresse email',
                              // Replace with your label text
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFB2B2B2),
                                fontFamily: 'Segoe',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                  child: FormBuilderTextField(
                    key: ValueKey('email'),
                    name: 'email',
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: FormErrorStructure.adresseEmptyError),
                      FormBuilderValidators.email(errorText: FormErrorStructure.adresseValidatorError),
                    ]),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '* ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Password',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFB2B2B2),
                                fontFamily: 'Segoe',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                  child: FormBuilderTextField(
                    key: ValueKey('password'),
                    name: 'password',
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: FormErrorStructure.emptyPassword),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      Map<String, dynamic> formData =
                          _formKey.currentState!.value;
                      String email = formData['email'];
                      String password = formData['password'];
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                FormErrorStructure.globalSnackBarError)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00082B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),

                  child: Text(
                    "S'INSCRIRE",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 22),
                Text(
                  'OU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB2B2B2)),
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      // Use Flexible here
                      child: Container(
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/google_icon.svg',
                              width: 30,
                              height: 50,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              // Use Expanded here
                              child: Text(
                                "Connectez-vous avec Google",
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 12,
                                  fontFamily: 'Segoe',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/facebook_icon.svg',
                      width: 35,
                      height: 31,
                    ),
                    SizedBox(width: 12),
                    SvgPicture.asset(
                      'assets/twitter_icon.svg',
                      width: 35,
                      height: 31,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Avez-vous déja un compte ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFFB2B2B2),
                            fontFamily: 'Segoe',
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                // Customize the transition animation here
                                const begin = Offset(1.0, 0.0); // Slide from right to left
                                const end = Offset.zero;
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500), // Set the transition duration
                            ),
                          );
                        },
                        child: Text(
                          " Connectez-vous.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF00082B),
                            fontFamily: 'Segoe',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
