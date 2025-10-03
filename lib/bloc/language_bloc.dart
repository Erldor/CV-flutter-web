import 'package:flutter_bloc/flutter_bloc.dart';

/// --- События ---
abstract class LanguageEvent {}

class LanguageChange extends LanguageEvent {
  final String value;
  LanguageChange(this.value);
}


/// --- Состояния ---
class LanguageState {
  final String selectedLanguage;
  LanguageState(this.selectedLanguage);
}

/// --- Bloc ---
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(String changedLanguage) : super(LanguageState("ru")) {
    on<LanguageChange>((event, emit) => emit(LanguageState(event.value)));
  }
}