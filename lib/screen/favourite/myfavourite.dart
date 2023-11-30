import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {


  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        shadowColor: Colors.black,
        elevation: 2,
        title:const Text("My Favourites"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
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
                        }, 
                        icon: const Icon(Icons.favorite)),
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