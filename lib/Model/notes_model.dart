
import 'package:hive/hive.dart';
part  'notes_model.g.dart';

@HiveType(typeId: 0)
class HiveModelScreen  extends HiveObject{

 @HiveField(0)
  String? title;
  @HiveField(1)
  String? discription;
  HiveModelScreen({required this.title,required this.discription});
}