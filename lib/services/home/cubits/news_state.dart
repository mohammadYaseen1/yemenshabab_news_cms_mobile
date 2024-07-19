part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

final class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsEntity newsEntity;
  final Data? extraNews;

  const NewsLoaded(this.newsEntity, this.extraNews);

  @override
  List<Object?> get props => [newsEntity, extraNews];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewsByKeywordsLoading extends NewsState {}

class NewsByKeywordsLoaded extends NewsState {
  final Data data;

  const NewsByKeywordsLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class NewsByKeywordsError extends NewsState {
  final String message;

  const NewsByKeywordsError(this.message);

  @override
  List<Object?> get props => [message];
}
