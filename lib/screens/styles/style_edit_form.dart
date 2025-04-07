import 'package:flutter/material.dart';
import 'package:style_dispatch/services/database_service.dart';

class StyleEditForm extends StatefulWidget {
  const StyleEditForm({super.key});
  @override
  _StyleEditFormState createState() => _StyleEditFormState();
}

class _StyleEditFormState extends State<StyleEditForm> {
  final Map<String, dynamic> style = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop();
      _saveStyleToDatabase();
    }
  }

  void _saveStyleToDatabase() {
    DatabaseService.instance.initDatabase();
    DatabaseService.instance.insertStyle(style).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFormFields(),
                const SizedBox(height: 30),
                _buttonRow(context: context, whenSave: saveForm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _textFormField(
          whenSave: (value) => style['styleNo'] = value,
          caption: 'Style_no',
        ),
        _dropdownField(
          whenSave: (value) => style['Category'] = value,
          caption: 'Category',
        ),
        _textFormField(
          whenSave: (value) => style['Designer'] = value,
          caption: 'Designer',
        ),
        _textFormField(
          whenSave: (value) => style['Description'] = value,
          caption: 'Desc',
        ),
      ],
    );
  }
}

Widget _textFormField({
  required void Function(String?) whenSave,
  required String caption,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextFormField(
      decoration: InputDecoration(label: Text(caption)),
      onSaved: whenSave,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    ),
  );
}

Widget _dropdownField({
  required void Function(String?) whenSave,
  required String caption,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: DropdownButtonFormField<String>(
      items: const [
        DropdownMenuItem<String>(value: 'Casual', child: Text('Casual')),
        DropdownMenuItem<String>(value: 'Festive', child: Text('Festive')),
        DropdownMenuItem<String>(value: 'LoungeWear', child: Text('LoungeWear')),
        DropdownMenuItem<String>(value: 'Formal', child: Text('Formal')),
      ],
      onChanged: whenSave,
      value: null,
      validator: (value) => value == null ? 'Please select a value' : null,
      decoration: InputDecoration(label: Text(caption)),
    ),
  );
}

Widget _buttonRow({
  required BuildContext context,
  required VoidCallback whenSave,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        onPressed: whenSave,
        child: const Text('Save'),
      ),
      const SizedBox(width: 30),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancel'),
      ),
    ],
  );
}