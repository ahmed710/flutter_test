import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:habhoub/CircularProgressIndicator.dart';

class StepWidgetSecond extends StatefulWidget{
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final int stepNumber;
  final int totalSteps;
  final AnimationController animationController;

  StepWidgetSecond({
    required this.stepNumber,
    required this.totalSteps,
    required this.animationController,
  });
  @override
  _StepWidgetSecondState createState() => _StepWidgetSecondState();
}
class _StepWidgetSecondState extends State<StepWidgetSecond> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(00.0),
          child: FormBuilder(
            key: widget._formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomProgressIndicator(
                        animationController: widget.animationController, // Pass the animationController here
                        stepNumber: widget.stepNumber, // Pass the stepNumber here
                        totalSteps: widget.totalSteps,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,30,0),
                      child: Text(
                        'Second Step',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Informations Client',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4B4B4B)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '* ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFFF4200),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Nom et Prénom',
                                  style: TextStyle(
                                    fontSize: 16,
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
                        height: 30,
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
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '* ', // Add the asterisk here
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFF4200),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Email',
                                    style: TextStyle(
                                      fontSize: 16,
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
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '* ', // Add the asterisk here
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFF4200),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Confirmation Email',
                                    style: TextStyle(
                                      fontSize: 16,
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
                        height: 30,
                        child: FormBuilderTextField(
                          key: ValueKey('email'),
                          name: 'email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '* ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFF4200),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Télèphone',
                                    style: TextStyle(
                                      fontSize: 16,
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
                        height: 30,
                        child: FormBuilderTextField(
                          key: ValueKey('telephone'),
                          name: 'telephone',
                          keyboardType: TextInputType.phone,
                          obscureText: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '* ', // Add the asterisk here
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFF4200),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Adresse',
                                    style: TextStyle(
                                      fontSize: 16,
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
                        height: 30,
                        child: FormBuilderTextField(
                          key: ValueKey('email'),
                          name: 'email',
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (widget._formKey.currentState?.saveAndValidate() ?? false) {
                            Map<String, dynamic> formData =
                                widget._formKey.currentState!.value;
                            String email = formData['email'];
                            String telephone = formData['telephone'];
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Veuillez corriger les erreurs dans le formulaire.')),
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
