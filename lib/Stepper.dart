
import 'package:flutter/material.dart';
import 'package:habhoub/StepWidgetFirst.dart';
import 'package:habhoub/StepWidgetSecond.dart';
import 'package:habhoub/StepWidgetThird.dart';

class ButtonController {
  Map<String, int?> selectedButtonIndices = {};

  bool isSelected(String group, int index) {
    return selectedButtonIndices[group] == index;
  }

  void selectButton(String group, int? index) {
    selectedButtonIndices[group] = index;
  }
}

class MyButton extends StatefulWidget {
  final int stepNumber;
  final int totalSteps;
  final String buttonText;
  final int buttonIndex;
  final String group;
  final ButtonController buttonController;
  final VoidCallback onTap;

  MyButton({
    required this.stepNumber,
    required this.totalSteps,
    required this.buttonText,
    required this.buttonIndex,
    required this.group,
    required this.buttonController,
    required this.onTap,
  });

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.buttonController.isSelected(widget.group, widget.buttonIndex)
              ? Color(0xFF00082B)
              : Color(0xFFFFFFFF),
        ),
        elevation: MaterialStateProperty.all<double>(
          widget.buttonController.isSelected(widget.group, widget.buttonIndex) ? 3 : 0,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
            side: BorderSide(width: 0.5, color: Colors.black),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(150, 40)),
      ),
      child: Text(
        widget.buttonText,
        style: TextStyle(
          color: widget.buttonController.isSelected(widget.group, widget.buttonIndex)
              ? Color(0xFFFFFFFF)
              : Color(0xFF4B4B4B),
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}



class StepNavigationWidget extends StatelessWidget {
  final int currentPageIndex;
  final int totalSteps;
  final AnimationController animationController;

  StepNavigationWidget({
    required this.currentPageIndex,
    required this.totalSteps,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 13.0,
            height: 13.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPageIndex == index
                  ? Color(0xFF00082B)
                  : Color(0xFFD6D6D6),
            ),
          ),
        );
      }),
    );
  }
}

class StepperPage extends StatefulWidget {

  const StepperPage({Key? key}) : super(key: key);

  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> with SingleTickerProviderStateMixin {
  void goToNextStep(bool shouldSwipe) {
    print(shouldSwipe);
    if (shouldSwipe) {
      print(_currentPageIndex);
      int nextPageIndex = _currentPageIndex + 1;
        _pageController.animateToPage(3 , duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
  late PageController _pageController;
  late AnimationController _animationController;
  int index =0;
  double _initialValue=0;
  int _previousPageIndex = 0;
  int _currentPageIndex = 1;
  bool isSwipedRight = true ;
  final int _totalSteps = 3;
  final ButtonController handleProfessionelButtonTap = ButtonController();
  final ButtonController insuranceTypeButtonController = ButtonController();
  bool alternate = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
      value:_initialValue,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handlePageChange(int i, {bool userSwipe = false}) {
    setState(() {
      if (userSwipe) {
        if (i > _currentPageIndex) {
          _animationController.animateTo((i / _totalSteps)+_initialValue,
              duration: Duration(seconds: 4), curve: Curves.easeOut);
        } else if (i < _currentPageIndex) {
          _animationController.animateTo((i) / _totalSteps,
              duration: Duration(seconds: 4), curve: Curves.easeOut);
        }
      }
      _currentPageIndex = i;
    });
  }
  void _detectSwipeDirection(int newIndex) {
    if (newIndex >= _currentPageIndex) {
      isSwipedRight=true ;
    } else if (newIndex < _currentPageIndex) {
      isSwipedRight=false ;
    }
    _previousPageIndex = _currentPageIndex;
    _currentPageIndex = newIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
          onPageChanged: (index) {
            _detectSwipeDirection(index);
              _handlePageChange(index, userSwipe: true);
              this.index = index;
            },
            children: [
              StepWidgetFirst(
                isSwipedRight: isSwipedRight ,
                lastStepNumber:_currentPageIndex,
                stepNumber: 1,
                totalSteps: 3,
                handleProfessionelButtonTap: handleProfessionelButtonTap,
                insuranceTypeButtonController: insuranceTypeButtonController,
              ),
              StepWidgetSecond(
                isSwipedRight: isSwipedRight,
                lastStepNumber:_currentPageIndex,
                stepNumber: 2,
                totalSteps: 3,
                goToNextStep: goToNextStep,
              ),
              StepWidgetThird(
                isSwipedRight: isSwipedRight ,
                lastStepNumber:_currentPageIndex,
                stepNumber: 3,
                totalSteps: 3,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: StepNavigationWidget(
              currentPageIndex: _currentPageIndex,
              totalSteps: _totalSteps,
              animationController: _animationController,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StepperPage(),
  ));
}
