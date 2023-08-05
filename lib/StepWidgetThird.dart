import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:habhoub/CircularProgressIndicator.dart';

class StepWidgetThird extends StatefulWidget {
  final int stepNumber;
  final int totalSteps;
  final AnimationController animationController;

  StepWidgetThird({
    required this.stepNumber,
    required this.totalSteps,
    required this.animationController,
  });

  @override
  _StepWidgetThirdState createState() => _StepWidgetThirdState();
}

class _StepWidgetThirdState extends State<StepWidgetThird> {
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  List<PlatformFile>? _selectedFiles;

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: CustomProgressIndicator(
                        animationController: widget.animationController, // Pass the animationController here
                        stepNumber: widget.stepNumber, // Pass the stepNumber here
                        totalSteps: widget.totalSteps, // Pass the totalSteps here
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,30,0),
                      child: Text(
                        'Third Step',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0),
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
                              text: 'Ajouter Un Document',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B4B4B)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    await _pickFiles();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Importez Votre Fichier',
                        style: TextStyle(color: Color(0xFF4B4B4B)),
                      ),
                      SvgPicture.asset(
                        'assets/icons/importer.svg',
                        width:20,
                        height: 20,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    minimumSize: Size(250, 40),
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
                              text: 'Ajouter Un Document',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B4B4B)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    await _pickFiles();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Importez Votre Fichier',
                        style: TextStyle(color: Color(0xFF4B4B4B)),
                      ),
                      SvgPicture.asset(
                        'assets/icons/importer.svg',
                        width:20,
                        height: 20,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    minimumSize: Size(250, 40),
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
                              text: 'Télécharger Votre Document',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B4B4B)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    // Implement your download logic here
                    if (_selectedFiles != null && _selectedFiles!.isNotEmpty) {
                      String fileNames = _selectedFiles!
                          .map((file) => file.name)
                          .join(", ");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Téléchargement de fichiers: $fileNames')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Aucun fichier sélectionné à télécharger.')),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Télécharger Votre Fichier',
                        style: TextStyle(color: Color(0xFF4B4B4B)),
                      ),
                      Icon(Icons.file_download_outlined, color: Color(0xFF00082B)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    minimumSize: Size(250, 40),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Your validation logic here

                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      Map<String, dynamic> formData = _formKey.currentState!.value;
                      String email = formData['email'];
                      String telephone = formData['telephone'];

                      // Additional validation logic and submission process.
                      // Implement your own validation and submission logic here.
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Veuillez corriger les erreurs dans le formulaire.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Valider',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00082B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    minimumSize: Size(182, 47),
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
