import 'package:api1/cubit/category_cubit.dart';
import 'package:api1/feature/home/widgets/category_button.dart';
import 'package:api1/feature/home/widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CategoryCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<CategoryCubit>();
    cubit.fetchData(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadimgState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategorySuccessState) {
          state.list;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Products'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                CategoryButton(
                  onTap: (url,index) => cubit.fetchData(url: url,index: index),
                  selectedIndex: cubit.selectedIndex,
                ),

                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return CustomProductCard(productModel: state.list[index]);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
