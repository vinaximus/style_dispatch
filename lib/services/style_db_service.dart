//import package sqflite common ffi
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class StyleDbService {
  static final StyleDbService instance = StyleDbService._privateConstructor();

  StyleDbService._privateConstructor();

  factory StyleDbService() {
    return instance;
  }
}


//What the entire class does
/*
  stylehandler=stylesservice();
  stylehandler.insert(Style)
  stylehandler.delete(ID)
  stylehandler.update(ID,Style)

  private openDb() {

  }

  insert(style) {
    Use tomap to convert the style object to a map}
    insert the styles with error handling
*/

