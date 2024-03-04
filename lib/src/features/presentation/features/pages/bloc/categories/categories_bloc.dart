import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/features/domain/entities/categories_entity.dart';
import 'package:foodie_heaven/src/features/domain/usecases/categories_usecases.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCases _categoriesUseCases;

  CategoriesBloc(this._categoriesUseCases) : super(CategoriesInitial()) {
    on<BurgerEvent>(_burgerEvent);
    on<PizzaEvent>(_pizzaEvent);
    on<FriesEvent>(_friesEvent);
    on<SandwichEvent>(_sandwichEvent);
    on<WrapEvent>(_wrapEvent);
    on<ComboEvent>(_comboEvent);
    on<CoolDrinksEvent>(_coolDrinksEvent);
    on<AllEvent>(_allEvent);
  }

  void _burgerEvent(BurgerEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getBurger();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _pizzaEvent(PizzaEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getPizza();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _allEvent(AllEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getAll();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _friesEvent(FriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getFries();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _sandwichEvent(
      SandwichEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories =
          await _categoriesUseCases.getSandwich();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _wrapEvent(WrapEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getWrap();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _comboEvent(ComboEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories = await _categoriesUseCases.getCombo();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }

  void _coolDrinksEvent(
      CoolDrinksEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    try {
      List<CategoriesEntity> categories =
          await _categoriesUseCases.getCoolDrinks();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }
}
