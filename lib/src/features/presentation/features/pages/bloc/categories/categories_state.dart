part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String errorMessage;

  CategoriesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CategoriesLoaded extends CategoriesState {
  final List<CategoriesEntity> categories;

  CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}
