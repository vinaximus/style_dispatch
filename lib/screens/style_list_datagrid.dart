import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import 'package:style_dispatch/modals/style.dart';

class StyleListDatagrid extends StatefulWidget {
  StyleListDatagrid({super.key, required this.dataSource});

  List<Style> dataSource = [];
  @override
  State<StyleListDatagrid> createState() {
    return _StyleListDatagrid();
  }
}

class _StyleListDatagrid extends State<StyleListDatagrid> {
  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        source: styleDataSource(dataSource: widget.dataSource),
        columns: [
          GridColumn(columnName: 'Style No', label: Text('Style No')),
          GridColumn(columnName: 'Category', label: Text('Category')),
          GridColumn(columnName: 'Designer', label: Text('Designer')),
        ]);
    throw UnimplementedError();
  }
}

class styleDataSource extends DataGridSource {
  List<Style> dataSource = [];
  List<DataGridRow> styleRecords = <DataGridRow>[];
  styleDataSource({required this.dataSource}) {
    styleRecords = dataSource.map((e) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'Style No', value: e.style_no),
        DataGridCell(columnName: 'Category', value: e.category),
        DataGridCell(columnName: 'Designer', value: e.designer),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => styleRecords;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Text(row.getCells()[0].value),
      Text(row.getCells()[1].value),
      Text(row.getCells()[2].value),
    ]);
    throw UnimplementedError();
  }
}
