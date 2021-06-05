import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trailapp/models/productData.dart';
import 'package:trailapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final productJson =
        await rootBundle.loadString("assets/Files/product_data.json");
    final decodedData = jsonDecode(productJson);
    var productsData = decodedData['products'];
    ProductModel.product = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(),
              if (ProductModel.product != null &&
                  ProductModel.product.isNotEmpty)
                ProductList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "ProductCase".text.xl5.bold.color(MyTheme.darkBlueColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ProductModel.product.length,
        itemBuilder: (context, index) {
          final item = ProductModel.product[index];
          return ProductItem(item: item);
        });
  }
}

class ProductItem extends StatelessWidget {
  final Item item;

  const ProductItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        ProductImage(image: item.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.name.text.lg.bold.color(MyTheme.darkBlueColor).make(),
            item.description.text.color(Colors.black54).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${item.price}".text.bold.xl.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlueColor)),
                    onPressed: () {},
                    child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.square(150).rounded.make().py12();
  }
}

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .wh40(context);
  }
}
