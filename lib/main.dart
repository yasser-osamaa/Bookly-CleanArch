import 'package:clean/constants.dart';
import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/functions/service_locator.dart';
import 'package:clean/core/utils/simple_bloc_observer.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:clean/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean/features/home/presentation/manager/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSearchtBox);

  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchFeatureBooksCubit>(
          create: (context) {
            return FetchFeatureBooksCubit(
              fetchFeatureBooksUseCase: locator.get<FetchFeatureBooksUseCase>(),
            )..fetchFeatureBooks();
          },
        ),
        BlocProvider<FetchNewestBooksCubit>(
          create: (context) {
            return FetchNewestBooksCubit(
              fetchNewestBooksUseCase: locator.get<FetchNewestBooksUseCase>(),
            )..fetchNewestBooks();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
