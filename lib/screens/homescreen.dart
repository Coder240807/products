import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import 'package:products/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(products[index].title),
              subtitle: Text('${products[index].price}'),
              leading: Image.network(products[index].image),
            ),
          );
        },
      ),
    );
  }

  Future<void> getProducts() async {
    products = await Api().getProducts();
    setState(() {});
  }
}
