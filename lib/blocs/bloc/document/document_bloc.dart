import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fllutter_learn/model/document_response.dart';
import 'package:fllutter_learn/repositories/document_repositories.dart';
import 'package:meta/meta.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentRepositories documentRepository;
  DocumentBloc({required this.documentRepository}) : super(DocumentLoading()) {
    on<DocumentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<fetchDocument>((event, emit) async {
      emit(DocumentLoading());
      // call the document repository

      try {
      final DocumentResponse response =
         await documentRepository.fetchDocument();
      //get the current page
      final currentPage = response.meta?.currentPage ?? 0;
      final hasReachedMax = response.meta?.lastPage == currentPage;
      emit(Documentloaded(
        documents: response.data ?? [],
        hasReachedMax: hasReachedMax,
        currentPage: currentPage,

      ));
      } catch (e) {
        emit(DocumentError(message: e.toString()));
      }
      
    });



    on<fetchDocumentNextPage>((event, emit) async {
      try {
        final state = this.state as Documentloaded;
        //CREATE QUERY PARAMETERS
        final Map<String, dynamic> queryParameters = {
          'page': state.currentPage + 1,
        };

      final DocumentResponse documents =
         await documentRepository.fetchDocument(
          queryParameters: queryParameters
         );
      //get the current page
      final int? currentPage = documents.meta!.currentPage;
      final bool hasReachedMax = documents.meta?.lastPage == currentPage;
      emit(Documentloaded(
        documents: [
          ...state.documents, ...?documents.data
        ],
        hasReachedMax: hasReachedMax,
        currentPage: currentPage!,

      ));
      } catch (e) {
        emit(DocumentError(message: e.toString()));
      }
      
    });

    on<searchDocument>((event, emit) async {
      try {
            emit(DocumentLoading());
              final Map<String, dynamic> queryParameters = {
                'filter[text]': event.query,
              };

              final DocumentResponse documents =
                await documentRepository.fetchDocument(
                  queryParameters: queryParameters
                );
              final int? currentPage = documents.meta!.currentPage;
              final bool hasReachedMax = documents.meta?.lastPage == currentPage;
              emit(Documentloaded(
                documents: documents.data ?? [],
                hasReachedMax: hasReachedMax,
                currentPage: currentPage!,
            ));
      } catch (e) {
        emit(DocumentError(message: e.toString()));
      }
    });
  }
}