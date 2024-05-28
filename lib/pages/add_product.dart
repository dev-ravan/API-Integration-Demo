import 'package:demo/Data/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  void initState() {
    final provider = Provider.of<ProductProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Add Product"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: product.titleController,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      product.addProduct();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Product"))
              ],
            ),
          ));
    });
  }
}
