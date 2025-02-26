part of 'document_bloc.dart';

sealed class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object> get props => [];

}

class DocumentLoading extends DocumentState {
  @override
  List<Object> get props => [];
}

class Documentloaded extends DocumentState {
  final List<Document> documents;
  final bool  hasReachedMax;
  final int  currentPage;

  const Documentloaded({
      required this.documents,
     required this.hasReachedMax, 
     required this.currentPage
  });

  @override
  List<Object> get props => [documents, hasReachedMax, currentPage];
  
  Documentloaded copyWith({
    List<Document>? documents,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return Documentloaded(
      documents: documents ?? this.documents,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class DocumentError extends DocumentState {
  final String message;

  const DocumentError({required this.message});

  @override
  List<Object> get props => [message];
}
 