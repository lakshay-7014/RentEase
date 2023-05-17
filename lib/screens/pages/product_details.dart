import 'package:flutter/material.dart';
import 'package:minor/views/widgets/custom_appBar.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar(name: "DETAILS"),
    body: Text("HELLO"),);
  }
}