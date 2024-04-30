import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("HIVE DATABASE"),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          FutureBuilder(
           // future:  Hive.openBox('Ubaid'),
           future: Hive.openBox('Ubaid'),
            
             builder: (context,snapshot){
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('name').toString()),
                    // subtitle: Text(snapshot.data!.get('product').toString()) ,
                    trailing: SingleChildScrollView(
                      scrollDirection: Axis.vertical, 
                      child: Column(
                        children: [
                          IconButton(onPressed: (){
                          //Update Hive...
                           snapshot.data!.put('name', 'Ubaid  nalla ban gaya');
                          //  snapshot.data!.delete('product');
                           setState(() {
                             
                           });

                         
                          }, icon: const Icon(Icons.edit)
                          ),
                        
                          
                        ],
                      
                      ),
                    ),
                   
                   
                    
                    ),
                ],
              );
                

             })


        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{

        var box = await Hive.openBox('Ubaid');
        box.put('name', 'Ubaid khan');
        box.put('age', 26);
        box.put("product",{
          "Mobile" : 'Q Mobile',
          "Price": '40000',
          "Specification": "8 GB, 256 RAM",

        });

     
          print(box.get('name'));
          print(box.get('age'));
          print(box.get('product'));


      
      
        

        
        

      },
      child: const Icon(Icons.add),),
    );
  }
}
