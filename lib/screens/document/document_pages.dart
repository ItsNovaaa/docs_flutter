import 'package:fllutter_learn/repositories/document_repositories.dart';
import 'package:flutter/material.dart';
import 'package:fllutter_learn/screens/document/document_item.dart';
import 'package:fllutter_learn/model/document_response.dart';


class DocumentPages extends StatefulWidget {
  const DocumentPages({super.key});

      @override
      State<DocumentPages> createState() => _DocumentPagesState();
    }

    class _DocumentPagesState extends State<DocumentPages> {
      final ProductRepository _productRepository = ProductRepository();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Document'),
          ),
          body: FutureBuilder<DocumentResponse>(
            future: _productRepository.fetchDocument(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final document = snapshot.data!.data?.length;
                return ListView.builder(
                  itemCount: document,
                  itemBuilder: (context, index) {
                    final document = snapshot.data!.data![index];
                    return DocumentItem(
                      title: document.title ?? 'No title',
                      text: document.text ?? 'No extracted text',
                      image: document.image ?? 'No image',
                    );
                  },
                );
              } else {
                return const Center(child: Text('No products found'));
              }
            },
          ),
        );
      }
}


