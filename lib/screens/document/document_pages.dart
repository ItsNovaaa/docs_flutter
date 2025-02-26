import 'package:fllutter_learn/blocs/bloc/document/document_bloc.dart';
import 'package:fllutter_learn/repositories/document_repositories.dart';
import 'package:flutter/material.dart';
import 'package:fllutter_learn/screens/document/document_item.dart';
import 'package:fllutter_learn/model/document_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DocumentPages extends StatefulWidget {
  const DocumentPages({super.key});

      @override
      State<DocumentPages> createState() => _DocumentPagesState();
    }

    class _DocumentPagesState extends State<DocumentPages> {

      //add  text controller
      final TextEditingController _searchController = TextEditingController();
      //add dispose
      @override
      void dispose() {
        _searchController.dispose();
        super.dispose();
      }
      //overide for init state
      @override
      void initState() {
        super.initState();
        context.read<DocumentBloc>().add(fetchDocument());
      }


      // final DocumentRepositories _documentRepository = DocumentRepositories();

      @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Documents',
                  // border: Inp,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      context.read<DocumentBloc>().add(
                        searchDocument(_searchController.text)
                      );
                    } else {
                      context.read<DocumentBloc>().add(fetchDocument());
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: BlocBuilder<DocumentBloc, DocumentState>(
              builder: (context, state) {
                if (state is DocumentLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Documentloaded) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<DocumentBloc>().add(fetchDocument());
                    },
                    child: ListView.builder(
                      itemCount: state.hasReachedMax
                          ? state.documents.length
                          : state.documents.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.documents.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<DocumentBloc>().add(fetchDocumentNextPage());
                                },
                                child: const Text('Load more'),
                              ),
                            ),
                          );
                        } else {
                          return ExpandablePanel(
                            title: state.documents[index].title ?? 'No title',
                            text: state.documents[index].text ?? 'No extracted text',
                            // image: state.documents[index].image ?? 'No image',
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text('No products found'));
                }
              },
            ),
          );
        }

      }


    //     );
    //     }
    // }
