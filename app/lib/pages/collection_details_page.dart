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
  late bool isReserved = false;
  late bool isreservedbyUser = false;

  @override
  void initState() {
    super.initState();
    book = widget.book;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isBorrow = await checkBorrowed(book['codigo']);
      isReserved = await checkReserved(book['codigo']);
      isreservedbyUser = await checkReservationIsThisUser(book['codigo']);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  Future<bool> checkBorrowed(String book) async {
    return await context.read<AuthService>().hasRequest(book).then((value) {
      return value;
    });
  }

  checkReserved(String book) async {
    return await context.read<AuthService>().hasReservation(book).then(
      (value) {
        return value;
      },
    );
  }

  checkReservationIsThisUser(String book) async {
    return await context.read<AuthService>().isReservationUser(book).then(
      (value) {
        return value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              color: FlutterFlowTheme.of(context).tertiary,
            ),
          ),
          title: Text(
            'Detalhes da obra',
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                  color: FlutterFlowTheme.of(context).onBackground,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).displayLargeFamily),
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 8, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  (book['foto'] == 'Colocar' ||
                                          book['foto'] == 'null')
                                      ? 'https://picsum.photos/seed/701/600'
                                      : book['foto'],
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.19,
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      'Ver capa',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            decoration:
                                                TextDecoration.underline,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
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
                            SizedBox(
                              width: 250,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      truncateWithEllipsis(40, book['nome']),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge,
                                    ),
                                  ),
                                  (context.read<AuthService>().isAdm)
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left:
                                                  0), // Mudar pra não quiebrar
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditBookPage(
                                                              book: book)));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .all(4),
                                              child: Icon(
                                                Icons.edit_square,
                                                size: 24,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Center(),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Autor: ${truncateWithEllipsis(40, book['autor'])}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                              ),
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
                            Text(
                              'Código: ${book['codigo']}',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Text(
                          // TODO Fazer lógica para dizer disponibilidade
                          'Previsão de Disponibilidade\n12/06/2023',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleLargeFamily,
                                color:
                                    FlutterFlowTheme.of(context).onBackground,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleLargeFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  (book['userloan'].toString() == 'null' &&
                          (!isReserved || isreservedbyUser))
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(top: 16),
                          child: (!isBorrow)
                              ? TextButton(
                                  onPressed: () async {
                                    showDialog<bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Confirmar Validação de usuário'),
                                          content: const SizedBox(
                                            height: 150,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Icon(
                                                    Icons
                                                        .connect_without_contact_rounded,
                                                    size: 80,
                                                  ),
                                                ),
                                                Text(
                                                    'Deseja realizar uma solicitação de Empréstimo?'),
                                              ],
                                            ),
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await context
                                                    .read<AuthService>()
                                                    .sendBorrowRequest(
                                                        book['codigo']);
                                                (isreservedbyUser)
                                                    ? context
                                                        .read<AuthService>()
                                                        .finishReservation(
                                                            book['codigo'])
                                                    : null;
                                                Navigator.pop(
                                                    alertDialogContext, true);
                                                setState(() {});
                                              },
                                              child: Text(
                                                'Confirmar',
                                                style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    fixedSize: const Size(double.infinity, 50),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryContainer,
                                    foregroundColor:
                                        FlutterFlowTheme.of(context)
                                            .overlayPrimary,
                                    elevation: 3,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
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
                                        color: FlutterFlowTheme.of(context)
                                            .overlayPrimary,
                                        size: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Solicitar Empréstimo',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .onPrimaryContainer,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
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
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    fixedSize: const Size(230, 50),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryContainer,
                                    elevation: 3,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
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
                                        color: FlutterFlowTheme.of(context).onPrimaryContainer,
                                        size: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Empréstimo Já Solicitado',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .onPrimaryContainer,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
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
                  (isReserved)
                      ? (isreservedbyUser)
                          ? Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 16, 0, 16),
                              child: TextButton(
                                onPressed: () async {
                                  await context
                                      .read<AuthService>()
                                      .cancelReservation(book['codigo']);
                                  setState(() {
                                    isReserved = false;
                                    isreservedbyUser = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  fixedSize: const Size(double.infinity, 48),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent2,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
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
                                      Icons.bookmark_remove,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryContainer,
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Cancelar Reserva',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryContainer,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 16, 0, 16),
                              child: TextButton(
                                onPressed: () async {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  fixedSize: const Size(190, 40),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent2,
                                  elevation: 3,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Obra Já Reservada',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                      : Padding(
                          // if book[cod]+ reservation = Solicitado: Livro já solicitado
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 16, 0, 16),
                          child: TextButton(
                            onPressed: () async {
                              context.read<AuthService>().doReservation(book);
                              setState(() {
                                isReserved = true;
                                isreservedbyUser = true;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              fixedSize: const Size(double.infinity, 48),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryContainer,
                              elevation: 3,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
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
                                  color: FlutterFlowTheme.of(context)
                                      .onSecondaryContainer,
                                  size: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Reservar',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .onSecondaryContainer,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
