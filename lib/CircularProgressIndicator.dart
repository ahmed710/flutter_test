import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int lastStepNumber;
  final int stepNumber;
  final int totalSteps;
  final bool isSwipedRight;

  const CustomProgressIndicator({
    required this.lastStepNumber,
    required this.stepNumber,
    required this.totalSteps,
    required this.isSwipedRight,
  });

  @override
  Widget build(BuildContext context) {
    final Tween<double> _progressTween;
    if (lastStepNumber==0 && stepNumber==1 && isSwipedRight==false) {
          _progressTween = Tween<double>(
          begin: ((stepNumber-1) / totalSteps) -0.1,
          end: stepNumber / totalSteps,
        );}
    else if (isSwipedRight==true) {
        _progressTween = Tween<double>(
          begin: ((stepNumber  -1) / totalSteps) +0.1,
          end: stepNumber / totalSteps,
        );}
    else {
      _progressTween = Tween<double>(
            begin: ((stepNumber  +1) / totalSteps) +0.1,
            end: stepNumber / totalSteps,
          );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder(
          tween: _progressTween,
          duration: Duration(seconds: 1),
          builder: (context, value, _) => SizedBox(
            width: 90.0,
            height: 90.0,
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              backgroundColor: Color(0xFFD6D6D6),
              value: value,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF4200)),
            ),
          ),
        ),
        Center(
          child: Text(
            '$stepNumber / $totalSteps',
            style: TextStyle(
              fontSize: 30.0,
              letterSpacing: -4.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF00082B),
            ),
          ),
        ),
      ],
    );
  }
}
