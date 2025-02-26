part of 'document_bloc.dart';

@immutable
sealed class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object> get props => [];
}

final class fetchDocument extends DocumentEvent {
  // @override
  // List<Object> get props => [];
}
final class fetchDocumentNextPage extends DocumentEvent {}

final class searchDocument extends DocumentEvent {
  final String query;

  const searchDocument(this.query);

  @override
  List<Object> get props => [query];
}
