import 'package:equatable/equatable.dart';

class L10nState extends Equatable {
  final String currentLanguage;

  const L10nState(this.currentLanguage);

  @override
  List<Object?> get props => [currentLanguage];
}

class InitialAppLanguage extends L10nState {
  const InitialAppLanguage() : super('vi');
}

class ChangeTheAppLanguage extends L10nState {
  const ChangeTheAppLanguage(String currentLanguage) : super(currentLanguage);
}
