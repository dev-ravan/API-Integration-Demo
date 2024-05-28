import 'package:demo/Data/product_provider.dart';
import 'package:demo/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.listOfProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Products"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddProduct()));
            },
            child: Icon(Icons.add),
          ),
          body: product.productList.isEmpty
              ? const Center(child: Text("No data available"))
              : ListView.builder(
                  itemCount: product.productList.length,
                  itemBuilder: (context, index) {
                    final data = product.productList[index];
                    return ListTile(
                      title: Text(data.brand ?? ""),
                    );
                  },
                ));
    });
  }
}
