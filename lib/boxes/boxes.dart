import 'package:hive/hive.dart';
import 'package:hive_inittlization/Model/notes_model.dart';

class  Boxes{
 static Box<HiveModelScreen> getData()=> Hive.box<HiveModelScreen>('notes');

}