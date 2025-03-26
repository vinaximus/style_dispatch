import 'package:flutter/material.dart';

class StyleEditForm extends StatelessWidget {
  const StyleEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
          child: Form(
        child: Container(
            // Set height and width to 50% of the screen
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            // Add padding
            padding: const EdgeInsets.all(30.0),
            child: Column(
              //Create textformfield for each property of style class
              children: [
                // Add Row with Text widget and TextFormField
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Style No: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      // Set width of SizedBox to 40% of the parent widget
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Style No',
                          fillColor: Colors.grey[200], // Set fill color
                          filled: true, // Enable fill color
                          border: OutlineInputBorder(), // Add outline border
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('Category: ')),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Category'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logic to check if all fields are filled
                        // For now, assume fields are filled
                        bool allFieldsFilled =
                            true; // Replace with actual validation logic
                        if (allFieldsFilled) {
                          // Save logic here
                          Navigator.of(context)
                              .pop(); // Close dialog after saving
                        }
                      },
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
