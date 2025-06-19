import 'package:api1/feature/home/widgets/custom_product_card.dart';
import 'package:api1/feature/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  Future<List<dynamic>> getData() async {
    final response = await dio.get(
      'https://fakestoreapi.com/products/category/jewelery',
    );
    final data = response.data;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('ERROR');
        } else if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Products'),
              centerTitle: true,
            ),
            body: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                final product = ProductModel(
                  image: item['image'],
                  title: item['title'],
                  description: item['description'],
                  rate: item['rating']['rate'],
                  count: item['rating']['count'],
                  price: item['price'],
                );
                return CustomProductCard(productModel: product);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
