import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
   CategoryButton({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });
  final Function(String url,int index) onTap;
  final int selectedIndex;

  final List<Map<String, String>> categories = [
    {'title': 'All', 'url': 'https://fakestoreapi.com/products/'},
    {
      'title': 'Electronics',
      'url': 'https://fakestoreapi.com/products/category/electronics',
    },
    {
      'title': 'Jewelery',
      'url': 'https://fakestoreapi.com/products/category/jewelery',
    },
    {
      'title': 'Women',
      'url': "https://fakestoreapi.com/products/category/women's%20clothing",
    },
    {
      'title': 'Men',
      'url': "https://fakestoreapi.com/products/category/men's%20clothing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(categories.length, (index) {
        print('Button pressed - index: $index, selectedIndex: $selectedIndex');

        return ElevatedButton(
          onPressed: ()=>onTap(categories[index]['url']!,index),
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedIndex == index
                ? Colors.green
                : Colors.grey,
          ),
          child: Text(
            categories[index]['title']!,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
