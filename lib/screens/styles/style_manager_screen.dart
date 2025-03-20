import 'package:flutter/material.dart';
import 'package:style_dispatch/modals/style.dart';
import 'package:style_dispatch/screens/style_list_datagrid.dart';

class StyleManagerScreen extends StatelessWidget {
  const StyleManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Style> styleData = generateTestData();
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        color: Colors.amber,
        width: 550,
        child: Column(
          children: [
            //Title
            Text(style: TextStyle(fontSize: 40), 'Style Management'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Search bar
                SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                        label: Text('Search'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.abc))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StyleListDatagrid(dataSource: styleData)
            //DataGrid Control Statefull Widget I think
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
