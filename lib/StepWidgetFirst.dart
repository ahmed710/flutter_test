import 'package:flutter/material.dart';
import 'package:habhoub/CircularProgressIndicator.dart';
import 'package:habhoub/Stepper.dart';
class StepWidgetFirst extends StatefulWidget {
  final int stepNumber;
  final int totalSteps;
  final AnimationController animationController;
  final ButtonController handleProfessionelButtonTap;
  final ButtonController insuranceTypeButtonController;

  StepWidgetFirst({
    required this.stepNumber,
    required this.totalSteps,
    required this.animationController,
    required this.handleProfessionelButtonTap,
    required this.insuranceTypeButtonController,
  });

  @override
  _StepWidgetFirstState createState() => _StepWidgetFirstState();
}


class _StepWidgetFirstState extends State<StepWidgetFirst> {
  void handleProfessionelButtonTap(int index) {
    setState(() {
      if (widget.handleProfessionelButtonTap.isSelected('professionel', index)) {
        widget.handleProfessionelButtonTap.selectButton('professionel', null);
      } else {
        widget.handleProfessionelButtonTap.selectButton('professionel', index);
        widget.handleProfessionelButtonTap.selectButton('professionel', index == 0 ? 0 : 1);
      }
    });
  }

  void handleInsuranceTypeButtonTap(int index) {
    setState(() {
      if (widget.insuranceTypeButtonController.isSelected('insuranceType', index)) {
        widget.insuranceTypeButtonController.selectButton('insuranceType', null);
      } else {
        widget.insuranceTypeButtonController.selectButton('insuranceType', index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomProgressIndicator(
                  animationController: widget.animationController,
                  stepNumber: widget.stepNumber,
                  totalSteps: widget.totalSteps,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: Text(
                  'First Step',
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
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Sélectionner Votre Choix',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B4B4B),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Professionel',
                buttonIndex: 0,
                group: 'professionel',
                buttonController: widget.handleProfessionelButtonTap,
                onTap: () => handleProfessionelButtonTap(0),
              ),
              SizedBox(width: 50),
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Particulier',
                buttonIndex: 1,
                group: 'professionel',
                buttonController: widget.handleProfessionelButtonTap,
                onTap: () => handleProfessionelButtonTap(1),
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Sélectionner Votre Choix',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B4B4B),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Auto',
                buttonIndex: 2,
                group: 'insuranceType',
                buttonController: widget.insuranceTypeButtonController,
                onTap: () => handleInsuranceTypeButtonTap(2),
              ),
              SizedBox(height: 40),
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Habitation',
                buttonIndex: 3,
                group: 'insuranceType',
                buttonController: widget.insuranceTypeButtonController,
                onTap: () => handleInsuranceTypeButtonTap(3),
              ),
              SizedBox(height: 40),
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Moto / Scooter',
                buttonIndex: 4,
                group: 'insuranceType',
                buttonController: widget.insuranceTypeButtonController,
                onTap: () => handleInsuranceTypeButtonTap(4),
              ),
              SizedBox(height: 40),
              MyButton(
                animationController: widget.animationController,
                stepNumber: widget.stepNumber,
                totalSteps: widget.totalSteps,
                buttonText: 'Santé',
                buttonIndex: 5,
                group: 'insuranceType',
                buttonController: widget.insuranceTypeButtonController,
                onTap: () => handleInsuranceTypeButtonTap(5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}