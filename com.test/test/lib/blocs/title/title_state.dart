import 'package:equatable/equatable.dart';

abstract class TitleState extends Equatable {
  const TitleState();
}

class TitleInitial extends TitleState {
  const TitleInitial() : super();

  @override
  List<Object?> get props => [];
}

class TitleLoading extends TitleState {
  const TitleLoading() : super();

  @override
  List<Object?> get props => [null];
}

class TitleLoaded extends TitleState {
  final String title;
  const TitleLoaded(this.title) : super();

  @override
  List<Object?> get props => [title];
}
