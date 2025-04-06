import 'package:flutter/material.dart';
import 'package:style_dispatch/services/database_service.dart';

class StyleEditForm extends StatefulWidget {
  const StyleEditForm({super.key});
  @override
  _StyleEditFormState createState() => _StyleEditFormState();
}

class _StyleEditFormState extends State<StyleEditForm> {
  Map<String,dynamic> style={};
  GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  void saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form state
      Navigator.of(context).pop(); // Close the dialog
      //Save the style to the database below
      // Initialize the database and insert the style
      DatabaseService.instance.initDatabase();
      DatabaseService.instance.insertStyle(style).then((value) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Form(
          key:_formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
                  child: Column(
                    children: [
                    _textFormField(whenSave: (value) {style['styleCode']=value;},
                      context: context,
                      caption: 'Style_no'),
                    _dropdownField(whenSave: (value) {style['Designer']=value;},
                      context: context,
                      caption: 'Category'),
                    _textFormField(whenSave: (value) {style['Designer']=value;},
                      context: context,
                      caption: 'Designer'),
                    _textFormField(whenSave: (value) {style['Description']=value;},
                      context: context,
                      caption: 'Desc'),
                    const SizedBox(height: 30,),
                    _buttonRow(context:context,whenSave: saveForm),
                  ],
                ),
              ),
          ],),
        ),
      )
    );
  }
}

// Text with TextFormField
Widget _textFormField({
  required void Function(String?) whenSave,
  required BuildContext context,
  required String caption}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextFormField(
      decoration: InputDecoration(label: Text(caption)),
      onSaved: ( value) {
        whenSave(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null; // Return null if the input is valid
      },
    ),
  );
}

// Text with TextFormField
Widget _dropdownField({
  required void Function(String?) whenSave,
  required BuildContext context,
  required String caption}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem<String>(value:'Causal',child: Text('Casual')),
        DropdownMenuItem<String>(value:'Festive',child: Text('Festive')),
        DropdownMenuItem<String>(value:'LoungeWear',child: Text('LoungeWear')),
        DropdownMenuItem<String>(value:'Formal',child: Text('Formal')),
      ],
      onChanged: (value) {whenSave(value);},
      value: null, // Set the initial value to null or a default value
      validator: (value) => value == null ? 'Please select a value' : null,
      decoration: InputDecoration(label: Text(caption),
      ),
    ),
  );
}

Widget _buttonRow ({
  required BuildContext context,
  required VoidCallback whenSave,
  }) {
  //Create to Buttons in a row Save and Cancel
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight
        ),
        onPressed:  whenSave,
        child: const Text('Save'),
      ),
      const SizedBox(width: 30),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight
        ),
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: const Text('Cancel'),
      ),
    ],
  );
}