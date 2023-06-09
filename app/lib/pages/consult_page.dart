import 'package:app/repository/book_repository.dart';
import 'package:flutter/material.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConsultPageState createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  final livros = BookRepository.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.7),
      body: SizedBox(
        height: 900,
        child: Column(
          children: [
            const TextField(),
            ListView.builder(
              itemCount: livros.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 2.5,
                                )),
                            child: Image.network(
                              livros[index].link,
                              width: 160,
                              height: 200,
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(livros[index].nome),
                                Text(livros[index].autor),
                                Text(livros[index].editora),
                                // Text(livros[index].ano),
                                const Text('Edição'),
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: const Size(110, 40),
                                    foregroundColor: const Color(0xFFF4EC70),
                                    elevation: 0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    shape: const StadiumBorder(side: BorderSide(color: Color(0xFFC2CC93), width: 3.5)),
                                    textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFF4EC70),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Detalhes'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          livros.removeLast();
        });
      }),
    );
  }
}
