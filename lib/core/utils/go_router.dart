import 'package:doctor_appointment/core/widgets/bottom_navigation_bar.dart';
import 'package:doctor_appointment/features/auth/presentation/views/login_view.dart';
import 'package:doctor_appointment/features/auth/presentation/views/signup_view.dart';
import 'package:doctor_appointment/features/calendar/presentation/views/calendar_view.dart';
import 'package:doctor_appointment/features/favorite/presentation/views/favorite_view.dart';
import 'package:doctor_appointment/features/home/presentation/views/category_detail_view.dart';
import 'package:doctor_appointment/features/home/presentation/views/home_view.dart';
import 'package:doctor_appointment/features/profile/presentation/views/profile_view.dart';
import 'package:doctor_appointment/features/splash/presentation/views/splash_view.dart';
import 'package:doctor_appointment/features/on_boarding_view/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kOnBoardingView = '/onBoardingView';
  static const kHomeView = '/homeView';
  static const kSignUpView = '/signUpView';
  static const kRoot = '/root';
  static const kFavoriteView = '/favoriteView';
  static const kCalendarView = '/calendarView';
  static const kProfileView = '/profileView';
  static const kCategoryDetailsView = '/categoryDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(path: kRoot, builder: (context, state) => const Root()),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: kCalendarView,
        builder: (context, state) => const CalendarView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kCategoryDetailsView,
        builder: (context, state) {
          // بنجيب الـ categoryName من الـ extra
          final name = state.extra as String? ?? 'Category';
          return CategoryDetailView(categoryName: name);
        },
      ),
    ],
  );
}
