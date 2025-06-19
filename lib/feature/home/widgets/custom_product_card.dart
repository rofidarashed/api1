import 'package:api1/core/styles/text_style.dart';
import 'package:api1/core/widgets/custom_rating_line.dart';
import 'package:api1/feature/details/details_screen.dart';
import 'package:api1/feature/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel productModel;
  const CustomProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DetailsScreen(productModel: productModel);
          },
        ),
      ),
      child: Card(
        child: Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(
                  productModel.image,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                    Text(
                      productModel.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: blueGrayStyle,
                    ),
                    CustomRatingLine(productModel: productModel),
                    Text(
                      '${productModel.price} \$'.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
