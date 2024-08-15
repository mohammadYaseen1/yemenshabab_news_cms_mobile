part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class NavigateCategory extends CategoryState {
  final CategorySection category;

  const NavigateCategory(this.category);

  @override
  List<Object?> get props => [category, category.nameEn];
}
