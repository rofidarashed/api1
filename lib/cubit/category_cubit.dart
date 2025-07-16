import 'package:api1/feature/home/widgets/get_data.dart';
import 'package:api1/feature/models/product_model.dart';
import 'package:bloc/bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<ProductModel> data = [];
  int _selectedIndex = 0;
    int get selectedIndex => _selectedIndex;

  Future<void> fetchData({String? url,required int index}) async {
        _selectedIndex = index; 
         print("Fetching data started for index: $index, URL: $url");
    emit(CategoryLoadimgState());
         print("Emitted CategoryLoadingState");
    try {
      final list = await getData(url ?? "https://fakestoreapi.com/products/");
      data = list;
      emit(CategorySuccessState(list: list));
    } catch (e) {
      emit(CategoryFailedState());
    }

    print('Updating selected index to $index');
  }
}
