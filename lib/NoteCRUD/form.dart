 

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_inittlization/Model/notes_model.dart';
import 'package:hive_inittlization/boxes/boxes.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Add"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder<Box<HiveModelScreen>>(
        valueListenable: Boxes.getData().listenable(), 
        builder: (context,box,  _){
          var data = box.values.toList().cast<HiveModelScreen>();
          return  ListView.builder(
            itemCount: box.length,
            itemBuilder: (context,snapshot){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             Text(data[snapshot].title.toString()),
                            const Spacer(),
                             IconButton(onPressed: (){
                            //  editData(context: context,title: data[snapshot].title.toString(),discription: data[snapshot].discription.toString(),hiveModelScreen: data[snapshot]);
                            editData(context: context,title: data[snapshot].title.toString(),discription: data[snapshot].discription.toString() ,hiveModelScreen: data[snapshot] );
                             
                             }, icon: const Icon(Icons.edit,color: Colors.blue,),),
                            const SizedBox(width: 15,),
                           IconButton(onPressed: (){
                            deletedata(data[snapshot]);
                           }, icon: const Icon(Icons.delete,color: Colors.red,))

                          ],
                        ),
                       
                        Text(data[snapshot].discription.toString()),
                      ],
                    ),
                  ),
                ),
              );

            },
            
            );
        }),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () async{
          showDiloge(context: context);
        },
        child:  const Icon(Icons.add),
        ),

        
    );

     
    
  }

  Future<void> showDiloge({context})async{
          return showDialog(
            context: context,
             builder: (context){
              return AlertDialog(
                title: const Text("Add Notes"),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Text",
                                            
                        )
                      ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: desController,
                      decoration: const InputDecoration(
                        hintText: "Enter Discription",
                        border: OutlineInputBorder(),

                      ),

                    )
                    ],
                  ),
                ),
               
                actions: [
                  TextButton(onPressed: (){
                     Navigator.pop(context);


                  }, child: const Text("Cancel")),
                  TextButton(onPressed: (){
                    final data = HiveModelScreen(title: titleController.text, discription: desController.text);
                    final box = Boxes.getData();
                    box.add(data);
                    titleController.clear();
                    desController.clear();
                     //data.save();
                  }


                  , child: const Text("ADD")),
                  
                ],
              );

             });
        }


        void deletedata(HiveModelScreen hiveModelScreen)async{
         await hiveModelScreen.delete();

        }

         Future<void> editData({context,  title, discription, hiveModelScreen})async{
          titleController.text = title;
          desController.text = discription ;
          return showDialog(
            context: context,
             builder: (context){
              return AlertDialog(
                title: const Text("Add Notes"),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Text",
                                            
                        )
                      ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: desController,
                      decoration: const InputDecoration(
                        hintText: "Enter Discription",
                        border: OutlineInputBorder(),

                      ),

                    )
                    ],
                  ),
                ),
               
                actions: [
                  TextButton(onPressed: (){
                     Navigator.pop(context);


                  }, child: const Text("Cancel")),
                  TextButton(onPressed: (){
                   hiveModelScreen!.title =  titleController.text.toString();
                   hiveModelScreen.discription = desController.text.toString();
                   hiveModelScreen.save();
                   titleController.clear();
                   desController.clear();
                   Navigator.pop(context);
                  }


                  , child: const Text("Save")),
                  
                ],
              );

             });
        }


}

