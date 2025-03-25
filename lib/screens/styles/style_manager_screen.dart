import 'package:flutter/material.dart';
import 'package:style_dispatch/modals/style.dart';
import 'package:style_dispatch/screens/style_list_datagrid.dart';

class StyleManagerScreen extends StatelessWidget {
  StyleManagerScreen({super.key});
  Color goodPurple = Color.fromARGB(255, 187, 100, 204);
  @override
  Widget build(BuildContext context) {
    List<Style> styleData = generateTestData();
    return Scaffold(
        appBar: AppBar(
          title: Text(
              style: Theme.of(context).textTheme.headlineSmall,
              'Style Management'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Row(
                children: [
                  SizedBox(
                    width: 180, // Reduced width
                    height: 35, // Reduced height
                    child: TextField(
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        fillColor: Theme.of(context)
                            .colorScheme
                            .surface, // White background for TextField
                        filled: true,
                        labelText: 'Search',
                        // Vibrant color for label
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .outline), // Vibrant color for border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: goodPurple,
                              width: 2), // Vibrant color for focused border
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface), // Vibrant color for icon
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      // Add your logic to add a new record here
                    },
                    icon: Icon(Icons.add,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface), // Vibrant color for add icon
                  ),
                ],
              ),
              SizedBox(height: 20),
              // DataGrid
              StyleListDatagrid(dataSource: styleData),
            ],
          ),
        ),
        backgroundColor: Theme.of(context)
            .scaffoldBackgroundColor // Light grey background for the screen
        );
  }
}
