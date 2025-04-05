import 'package:flutter/material.dart';

class StyleEditForm extends StatefulWidget {
  const StyleEditForm({super.key});

  @override
  _StyleEditFormState createState() => _StyleEditFormState();
}

class _StyleEditFormState extends State<StyleEditForm> {
  //Diaalog with Title baar
  //Label with TextField and TextFormField for Style No
  //Label with Text and DropDown for Category
  //Label with Text and TextFormField for Designer
  //Label with Text and TextFormField for Description
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: dialogShape(),
      child:SizedBox(
        //set width and hight to 50%
        width: MediaQuery.of(context).size.width * 0.35,
        //height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            _dialogTitleBar(context, 'Style Edit Form'),
            Padding(
              padding: 
                const EdgeInsets.only(top: 10, left: 20, right: 50, bottom: 30),
                child: Column(
                  children: [
                  _textFormFieldWithLabel(
                    context: context,
                    caption: 'Style_no'),
                  _dropdownFieldWithLabel(
                    context: context,
                    caption: 'Category'),
                  _textFormFieldWithLabel(
                    context: context,
                    caption: 'Designer'),
                  _textFormFieldWithLabel(
                    context: context,
                    caption: 'Desc'),
                  const SizedBox(height: 30,),
                  _buttonRow(context)
                ],
              ),
            ),
        ],),
      )
    );
  }
}


Widget _dialogTitle (BuildContext context,String title) {
  return Container(
    color: Theme.of(context).primaryColor,
    width: double.infinity,
    height: 30,
    child: Center(child: Text(title)),
  );
}

Widget _dialogTitleBar (BuildContext context,String title) {
  return SizedBox(height:40,
    child: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title),
      automaticallyImplyLeading: false,
      actions: [// Add a close button on the right side of the AppBar
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
      
    ),
  );
}


// Dialog Shape
RoundedRectangleBorder dialogShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
}

// Text with TextFormField
Widget _textFormFieldWithLabel({
    required BuildContext context,
    required String caption}
){
  return Row(children: [
    Text (caption,
      style: Theme.of(context).textTheme.labelLarge,
    ),
    SizedBox(width: 40,),
    Expanded(
      child: TextFormField(
        //decoration: InputDecoration(label: Text(caption),
        //),
      ),
    )
  ],);
}

// Text with TextFormField
Widget _dropdownFieldWithLabel({
  required BuildContext context,
  required String caption}){
  return Row(children: [
    Text (caption,
    style: Theme.of(context).textTheme.labelLarge,
    ),
    SizedBox(width: 40,),
    Expanded(
      child: DropdownButtonFormField<String>(
        items: [
          DropdownMenuItem<String>(value:'Causal',child: Text('Casual')),
          DropdownMenuItem<String>(value:'Festive',child: Text('Festive')),
          DropdownMenuItem<String>(value:'LoungeWear',child: Text('LoungeWear')),
          DropdownMenuItem<String>(value:'Formal',child: Text('Formal')),
        ],
        onChanged: (value) {},
        
      ),
    )
  ],);
}

Widget _buttonRow (BuildContext context) {
  //Create to Buttons in a row Save and Cancel
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColorLight
        ),
        onPressed: () {
          // Save action
        },
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