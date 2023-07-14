import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';
import '../widgets/duck_app_bar.dart';
import 'borrow_solicitations_page.dart';
import 'collection_details_page.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoanPageState createState() => _LoanPageState();
}

TextEditingController? searchController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List livros = [];

bool isLoading = false;

class _LoanPageState extends State<LoanPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String truncateWithEllipsis(int cutoff, String myString) {
  }

  String removeAccents(String str) {
    var withAccent = 'àáâãäåòóôõöøèéêëðçìíîïùúûüñšÿýž';
    var withoutAccent = 'aaaaaaooooooeeeeeciiiiuuuunsyyz';

    for (int i = 0; i < withAccent.length; i++) {
      str = str.replaceAll(withAccent[i], withoutAccent[i]);
    }
    return str;
  }

  searchByName([String name = '']) async {
    List filttedList = [];
    name = removeAccents(name.toLowerCase());

    setState(() {
      isLoading = true;
    });
    await atualizarLista();
    for (Map<String, dynamic> livro in livros) {
      if (removeAccents(livro['nome'].toLowerCase()).contains(name)) {
        filttedList.add(livro);
      }
    }

    livros = filttedList;

    setState(() {
      isLoading = false;
    });
  }

  atualizarLista() async {
    livros = await firebaseFirestore
        .collection('book')
        .where('nome', isNull: false)
        .orderBy('nome', descending: false)
        .get()
        .then((value) {
      List lista = [];
      for (var docSnapshot in value.docs) {
        Map<String, dynamic> livro = docSnapshot.data();
          lista.add(livro);
        }
      }
      return lista;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => searchByName());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        key: scaffoldKey,
        drawer: DuckAppBar(
          scaffoldKey: scaffoldKey,
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
<<<<<<< Updated upstream
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: IconButton(
              onPressed: () {
                setState(
                  () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                );
              },
              icon: Icon(
                Icons.menu,
                size: 24.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 24, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BorrowSolicitationsPage()));
                },
                icon: Icon(
                  Icons.notifications,
                  size: 24.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2,
=======
>>>>>>> Stashed changes
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 8),
                  child: Text(
                    'Meus Empréstimos',
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                  ),
                ),
              ),
              (isLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : (livros.isEmpty)
                      ? Expanded(
                          child: RefreshIndicator(
                            displacement: 10,
                            color: FlutterFlowTheme.of(context).secondary,
                            child: ListView(
                              children: const [
                                Center(
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: RefreshIndicator(
                            displacement: 10,
                            color: FlutterFlowTheme.of(context).secondary,
                            child: ListView.builder(
                              itemCount: livros.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  // substituir pelo modelo do card
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          child: Padding(
<<<<<<< Updated upstream
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => CollectionDetailsPage(book: livros[index]),
                                                ),
                                              ).whenComplete(() => searchByName(searchController?.text ?? '')),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image.network(
                                                  (livros[index]['foto'] == 'Colocar' || livros[index]['foto'] == 'null')
                                                      ? 'https://picsum.photos/seed/701/600'
                                                      : livros[index]['foto'],
                                                  width: 100,
                                                  height: 135,
                                                  fit: BoxFit.cover,
                                                ),
=======
>>>>>>> Stashed changes
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Align(
                                          child: Padding(
<<<<<<< Updated upstream
                                            padding: const EdgeInsets.only(left: 0.0),
=======
>>>>>>> Stashed changes
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  child: Text(
<<<<<<< Updated upstream
                                                    truncateWithEllipsis(20, livros[index]['nome']),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).headlineLarge,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    'Autor: ${truncateWithEllipsis(22, livros[index]['autor'])}',
=======
>>>>>>> Stashed changes
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Align(
                                                  child: Text(
                                                    'Ano: ${livros[index]['ano']}',
                                                    textAlign: TextAlign.start,
<<<<<<< Updated upstream
                                                    style: FlutterFlowTheme.of(context).titleLarge,
=======
>>>>>>> Stashed changes
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Align(
<<<<<<< Updated upstream
                                                      alignment: const AlignmentDirectional(0, 1),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          // livros[index]['dataDisponibilidade']
                                                          (!DateTime.now().isAfter(DateTime.parse(livros[index]
                                                                      ['dataDisponibilidade']
                                                                  .toString()
                                                                  .substring(0, 10)
                                                                  .replaceAll('/', '-')
                                                                  .split('-')
                                                                  .reversed
                                                                  .join())))
                                                              ? Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Container(
                                                                      width: 16,
                                                                      height: 16,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).success,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Em dia',
                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                    ),
                                                                  ],
                                                                )
                                                              : Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Container(
                                                                      width: 16,
                                                                      height: 16,
                                                                      decoration: BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context).error,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Atrasado',
                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                    ),
                                                                  ],
                                                                ),

                                                          TextButton(
                                                            onPressed: () async {
                                                              await context.read<AuthService>().renewLoan(livros[index]);
                                                              setState(() {});
                                                            },
                                                            style: OutlinedButton.styleFrom(
                                                              fixedSize: const Size(110, 40),
                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryContainer,
                                                              elevation: 3,
                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                              shape: const StadiumBorder(
                                                                  side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                              // shape: ,
                                                            ),
                                                            child: Text(
                                                              'Renovar',
                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                    color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                                        FlutterFlowTheme.of(context).titleLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Align(
                                                      alignment: const AlignmentDirectional(0, 1),
=======
>>>>>>> Stashed changes
                                                      child: TextButton(
                                                        onPressed: () async {
                                                          showDialog<bool>(
                                                            context: context,
                                                              return AlertDialog(
                                                                  height: 300,
                                                                  child: Column(
                                                                    children: [
                                                                      const Padding(
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                            livros[index]['dataDisponibilidade'],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                            livros[index]['nome'],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                  ),
                                                                  TextButton(
                                                                      await context
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      'Confirmar',
                                                                      style: TextStyle(
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
<<<<<<< Updated upstream
                                                        style: OutlinedButton.styleFrom(
                                                          fixedSize: const Size(110, 40),
                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                          elevation: 3,
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
=======
>>>>>>> Stashed changes
                                                          shape: const StadiumBorder(
                                                        ),
                                                        child: Text(
                                                          'Devolver',
<<<<<<< Updated upstream
                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                color: FlutterFlowTheme.of(context).onPrimaryContainer,
                                                                useGoogleFonts: GoogleFonts.asMap()
                                                                    .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
=======
>>>>>>> Stashed changes
                                                              ),
                                                        ),
                                                      ),
                                                    ),
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
