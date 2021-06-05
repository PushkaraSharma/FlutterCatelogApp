import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trailapp/models/productData.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$ ${item.price}",
          textScaleFactor: 1.4,
          style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
        ),
        onTap: (){
          print("$item pressed");
        },
      ),
    );
  }
}
