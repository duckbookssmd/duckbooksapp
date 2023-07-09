import 'package:app/pages/edit_book_page.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/assets/theme/flutter_flow_theme.dart';

class CollectionDetailsPage extends StatefulWidget {
  const CollectionDetailsPage({Key? key, required this.book}) : super(key: key);
  final Map<String, dynamic> book;

  @override
  // ignore: library_private_types_in_public_api
  _CollectionDetailsPageState createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  late Map<String, dynamic> book;
  late bool isBorrow = false;

  @override
  void initState() {
    super.initState();
    book = widget.book;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isBorrow = await checkBorrowed(book['codigo']);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  Future<bool> checkBorrowed(String book) async {
    return await context.read<AuthService>().hasRequest(book).then((value) {
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkBorrowed(book['codigo']);
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 30,
              color: FlutterFlowTheme.of(context).accent3,
            ),
          ),
          title: Text(
            'Detalhes da obra',
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                  color: FlutterFlowTheme.of(context).alternate,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/725/600',
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.15,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                                  child: Text(
                                    'Ver capa',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                          color: FlutterFlowTheme.of(context).info,
                                          decoration: TextDecoration.underline,
                                          useGoogleFonts:
                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Icon(
                                  Icons.arrow_right_alt,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Obra: ${truncateWithEllipsis(25, book['nome'])}',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          Text(
                            'Autor: ${book['autor']}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            'Ano: ${book['ano']}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            'Editora: ${book['editora']}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            'Edição: ${book['edicao']}ª',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            'Tipo: ${book['tipo']}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            'Gênero: ${book['genero']}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      child: Text(
                        'Previsão de Disponibilidade\n12/06/2023',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ),
                  ),
                ),
                (book['userloan'].toString() == 'null')
                    ? Padding(
                        padding: const EdgeInsetsDirectional.all(8),
                        child: (!isBorrow)
                            ? TextButton(
                                onPressed: () async {
                                  showDialog<bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Confirmar Validação de usuário'),
                                        content: const SizedBox(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Icon(
                                                  Icons.connect_without_contact_rounded,
                                                  size: 80,
                                                ),
                                              ),
                                              Text('Deseja realizar uma solicitação de Empréstimo?'),
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
                                              await context.read<AuthService>().sendBorrowRequest(book['codigo']);
                                              Navigator.pop(alertDialogContext, true);
                                              setState(() {});
                                            },
                                            child: Text(
                                              'Confirmar',
                                              style: TextStyle(color: FlutterFlowTheme.of(context).secondary),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  fixedSize: const Size(210, 50),
                                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.connect_without_contact_rounded,
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      size: 32,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Solicitar Empréstimo',
                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : TextButton(
                                onPressed: () async {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  fixedSize: const Size(230, 50),
                                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  textStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.connect_without_contact_rounded,
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      size: 32,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Empréstimo Já Solicitado',
                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(0),
                      ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: TextButton(
                    onPressed: () async {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fixedSize: const Size(135, 40),
                      backgroundColor: FlutterFlowTheme.of(context).accent2,
                      elevation: 3,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_outlined,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Reservar',
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                (context.read<AuthService>().isAdm)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 0), // Mudar pra não quiebrar
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditBookPage(book: book)));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).primary,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.all(4),
                              child: Icon(
                                Icons.edit_document,
                                size: 28,
                                color: FlutterFlowTheme.of(context).primaryBackground,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
