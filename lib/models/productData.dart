class ProductModel{
  static  List<Item> product = [];
}
class Item{
  final int id;
  final String name;
  final String description;
  final int price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.description, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id:map["id"],
      name: map["name"],
      description: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"]
    );
  }

  toMap()=>{
    "id":id,
    "description":description,
    "name":name,
    "price":price,
    "color":color,
    "image":image
  };
}


