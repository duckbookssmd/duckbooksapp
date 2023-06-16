import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConsultPageState createState() => _ConsultPageState();
}

TextEditingController? textController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List livros = [];

bool isLoading = false;

class _ConsultPageState extends State<ConsultPage> {
  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  atualizarLista() async {
    setState(() {
      isLoading = true;
    });
    livros = await firebaseFirestore.collection('obra').where('nome', isNull: false).orderBy('nome', descending: false).get().then((value) {
      List lista = [];
      for (var docSnapshot in value.docs) {
        lista.add(docSnapshot.data());
      }
      return lista;
    });
    setState(() {
      isLoading = false;
    });
  }
  // pegar uma query geral

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => atualizarLista());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFDFDF),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            atualizarLista();
          });
        },
        elevation: 8,
        label: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffDFDFDF),
        // automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                    child: Text(
                      'Consultar acervo',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        color: Color(0xFFB36E40),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          fillColor: const Color(0xff638D93),
                          isDense: true,
                          labelText: 'Pesquisar obra',
                          labelStyle: const TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00898989),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00898989),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00898989),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00898989),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          filled: true,
                          // fillColor: FlutterFlowTheme.of(context).cambridgeBlue,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              // Atualizar lista de livros
                              atualizarLista();
                            },
                            icon: const Icon(Icons.search),
                            color: Colors.white,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            (isLoading)
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: livros.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          // substituir pelo modelo do card
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
                                    // child: Image.network(
                                    //   livros[index].link,
                                    //   width: 160,
                                    //   height: 200,
                                    // ),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          truncateWithEllipsis(57, livros[index]['nome']),
                                          // softWrap: false,
                                          style: const TextStyle(
                                            color: Color(0xFFB36E40), // Defina a cor desejada aqui
                                          ),
                                        ),
                                        Text(
                                          livros[index]['autor'],
                                          style: const TextStyle(
                                            color: Color(0xFFB36E40), // Defina a cor desejada aqui
                                          ),
                                        ),
                                        Text(
                                          livros[index]['tipo'],
                                          style: const TextStyle(
                                            color: Color(0xFFB36E40),
                                          ),
                                        ),
                                        // Text(livros[index].ano),
                                        TextButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            fixedSize: const Size(110, 40),
                                            foregroundColor: const Color(0xffffffff),
                                            backgroundColor: const Color(0xff638D93),
                                            elevation: 0,
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            shape: const StadiumBorder(side: BorderSide(color: Color(0xff638D93), width: 3.5)),
                                            textStyle: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFB36E40),
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
                  ),
          ],
        ),
      ),
    );
  }
}
