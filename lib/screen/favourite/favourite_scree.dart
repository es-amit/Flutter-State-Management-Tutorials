import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
///import 'package:state_management/main.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/screen/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {

    //final favouriteProvider = Provider.of<FavouriteItemProvider>(context,listen: false);
    print("object");
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        shadowColor: Colors.black,
        elevation: 2,
        title:const Text("Favourite app"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFavouriteItemScreen()));
          }, 
          icon: const Icon(Icons.favorite))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(
                    builder: (context,value,child){
                      return ListTile(
                      title: Text("Item No - $index "),
                      trailing: IconButton(
                        onPressed: (){
                          if(value.selectedItem.contains(index)){
                            value.removeItem(index);
                          }
                          else{
                            value.addItem(index);
                          }
                        }, 
                        icon: value.selectedItem.contains(index) ? const Icon(Icons.favorite): const Icon(Icons.favorite_border_outlined)),
                    );
                    },
                    
                  );
                }),
            )
          ],
        ),
      ),
    );
  }
}