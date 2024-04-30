import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_inittlization/Model/notes_model.dart';
import 'package:hive_inittlization/NoteCRUD/form.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveModelScreenAdapter());
  await Hive.openBox<HiveModelScreen>('notes');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NoteHome(),
    );
  
  }
}

