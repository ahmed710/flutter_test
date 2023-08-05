import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final AnimationController animationController;
  final int stepNumber;
  final int totalSteps;

  const CustomProgressIndicator({
    required this.animationController,
    required this.stepNumber,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    // Create a tween for animating the progress indicator value from the old step number to the new one
    final Tween<double> _progressTween = Tween<double>(
      begin: (stepNumber - 1) / totalSteps, // Start from the previous value
      end: stepNumber / totalSteps,
    );

    // Create a curved animation with a longer duration of 4 seconds
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    // Animate the value using the tween and the curved animation
    final Animation<double> progressAnimation = _progressTween.animate(curvedAnimation);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 90.0,
          height: 90.0,
          child: CircularProgressIndicator(
            strokeWidth: 4.0,
            backgroundColor: Color(0xFFD6D6D6),
            value: stepNumber / totalSteps, // Use the animated value here
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF4200)),
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
