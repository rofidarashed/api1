import 'package:api1/feature/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomRatingLine extends StatelessWidget {
  final ProductModel productModel;
  const CustomRatingLine({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white.withValues(alpha: .5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   // productModel.rate.toString(),
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          // ),
          Icon(Icons.star, color: Colors.amber, size: 14),
          // Text('(${productModel.count.toString()})', style: grayStyle),
        ],
      ),
    );
  }
}
