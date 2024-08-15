import 'package:bloc/bloc.dart';

enum NavigationState { home, settings, profile, aboutUs, terms, privacy, faq }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void selectHome() => emit(NavigationState.home);

  void selectSettings() => emit(NavigationState.settings);

  void selectAboutUs() => emit(NavigationState.aboutUs);

  void selectTerms() => emit(NavigationState.terms);

  void selectPrivacy() => emit(NavigationState.privacy);

  void selectFaq() => emit(NavigationState.faq);

  void selectProfile() => emit(NavigationState.profile);
}
