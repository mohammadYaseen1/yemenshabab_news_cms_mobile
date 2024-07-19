import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategorySection? category;

  void navigate(CategorySection category) {
    this.category = category;
    emit(NavigateCategory(category));
  }
}
