import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/features/domain/usecases/categories_usecases.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/auth/auth_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/cart/cart_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/categories/categories_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/credential/credential_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/order/order_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/wishlist/wishlist_bloc.dart';

class AllBlocProviders {
  static get allBlocProviders =>
      [
        BlocProvider(create: (context) => AuthBloc()..add(AppStartedEvent())),
        BlocProvider(create: (context) => CredentialBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => WishlistBloc()),
        BlocProvider(create: (context) => OrderBloc()),
        BlocProvider(create: (context) => CategoriesBloc(CategoriesUseCases())),
      ];
}
