import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';
import '../widgets/duck_app_bar.dart';
import 'borrow_solicitations_page.dart';

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
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
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
        if (!(livro['isDeleted'].toString() == 'true') && livro['userloan'] == context.read<AuthService>().usuario!.uid) {
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
          elevation: 2,
          leading: IconButton(
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
              color: FlutterFlowTheme.of(context).onBackground,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BorrowSolicitationsPage()));
              },
              icon: Badge(
                textColor: FlutterFlowTheme.of(context).onPrimaryContainer,
                backgroundColor: FlutterFlowTheme.of(context).primaryContainer,
                largeSize: 20,
                smallSize: 20,
                label: Text('!'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 4.0),
                  child: Icon(
                    Icons.notifications,
                    size: 24.0,
                    color: FlutterFlowTheme.of(context).onBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 8),
                  child: Text(
                    'Meus Empréstimos',
                    style: FlutterFlowTheme.of(context).displayLarge,
                  ),
                ),
              ),
              (isLoading)
                  ? Center(
                      child: Image.asset(
                        'lib/assets/images/pato_girando.gif',
                        width: 150,
                      ),
                    )
                  : (livros.isEmpty)
                      ? Expanded(
                          child: RefreshIndicator(
                            displacement: 10,
                            color: FlutterFlowTheme.of(context).secondary,
                            onRefresh: () => searchByName(searchController?.text ?? ''),
                            child: ListView(
                              children: const [
                                Center(
                                  child: Text('Você não tem obras emprestadas!!'),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: RefreshIndicator(
                            displacement: 10,
                            color: FlutterFlowTheme.of(context).secondary,
                            onRefresh: () => searchByName(searchController?.text ?? ''),
                            child: ListView.builder(
                              itemCount: livros.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  // substituir pelo modelo do card
                                  padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(-1, -1),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.network(
                                                (livros[index]['foto'] == 'Colocar' || livros[index]['foto'] == 'null')
                                                    ? 'https://picsum.photos/id/24/367/267'
                                                    : livros[index]['foto'],
                                                width: 100,
                                                height: 135,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Align(
                                          alignment: const AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    truncateWithEllipsis(19, livros[index]['nome']),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).headlineLarge,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    'Autor: ${truncateWithEllipsis(20, livros[index]['autor'])}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    'Ano: ${livros[index]['ano']}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                      alignment: const AlignmentDirectional(0, 1),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 0.0),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                      const SizedBox(width: 4),
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
                                                                      const SizedBox(width: 4),
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
                                                                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Align(
                                                      alignment: const AlignmentDirectional(0, 1),
                                                      child: TextButton(
                                                        onPressed: () async {
                                                          showDialog<bool>(
                                                            context: context,
                                                            builder: (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text('Confirmar Validação de usuário'),
                                                                content: SizedBox(
                                                                  height: 300,
                                                                  child: Column(
                                                                    children: [
                                                                      const Padding(
                                                                        padding: EdgeInsets.all(16.0),
                                                                        child: Icon(
                                                                          Icons.sd_card_alert_outlined,
                                                                          size: 100,
                                                                        ),
                                                                      ),
                                                                      const Text('Devolver a Obra?'),
                                                                      Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Container(
                                                                          width: double.infinity,
                                                                          height: 30,
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            livros[index]['dataDisponibilidade'],
                                                                            style: const TextStyle(fontSize: 24),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Container(
                                                                          width: double.infinity,
                                                                          height: 30,
                                                                          decoration: BoxDecoration(
                                                                            shape: BoxShape.rectangle,
                                                                            borderRadius: BorderRadius.circular(8),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            livros[index]['nome'],
                                                                            style: const TextStyle(fontSize: 24),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actionsAlignment: MainAxisAlignment.spaceBetween,
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                    child: const Text('Cancelar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () async {
                                                                      await context
                                                                          .read<AuthService>()
                                                                          .confirmReturn(livros[index]);
                                                                      setState(() {
                                                                        Navigator.pop(alertDialogContext, true);
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      'Confirmar',
                                                                      style: TextStyle(
                                                                          color: FlutterFlowTheme.of(context).secondary),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        style: OutlinedButton.styleFrom(
                                                          fixedSize: const Size(110, 40),
                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                          elevation: 3,
                                                          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                          shape: const StadiumBorder(
                                                              side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                        ),
                                                        child: Text(
                                                          'Devolver',
                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                color: FlutterFlowTheme.of(context).onPrimaryContainer,
                                                                useGoogleFonts: GoogleFonts.asMap()
                                                                    .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
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
