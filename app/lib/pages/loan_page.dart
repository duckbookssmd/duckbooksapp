import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';
import '../utils/firestore_utils.dart';
import '../utils/string_utils.dart';
import '../widgets/duck_app_bar.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoanPageState createState() => _LoanPageState();
}

TextEditingController? searchController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List<Map<String, dynamic>> livros = [];

bool isLoading = false;

class _LoanPageState extends State<LoanPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// Pesquisa por livros que dentro do banco de dados e atualiza a lista com livros emprestados para esse usuário.
  ///
  /// Atualiza a lista com obras que possuam a [name] em seus nomes.
  searchLoanColection([String name = '']) async {
    setState(() {
      isLoading = true;
    });

    livros = await updateBookListByLoan(context.read<AuthService>().usuario!.uid);
    livros = await searchBooksByName(name, livros);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => searchLoanColection());
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
                            onRefresh: () => searchLoanColection(searchController?.text ?? ''),
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
                            onRefresh: () => searchLoanColection(searchController?.text ?? ''),
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
                                                                showDialog<bool>(
                                                                  context: context,
                                                                  builder: (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text('Renovar Empréstimo'),
                                                                      content: Text(
                                                                          "${livros[index]['renovacoes']}/3 Renovações restantes. Deseja renovar este empréstimo?"),
                                                                      actionsAlignment: MainAxisAlignment.spaceBetween,
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext, false),
                                                                          child: const Text('Cancelar'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () async {
                                                                            await context
                                                                                .read<AuthService>()
                                                                                .renewLoan(livros[index]);

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
                                                                backgroundColor: FlutterFlowTheme.of(context).onPrimaryContainer,
                                                                title: Text(
                                                                  'Devolução de Empréstimo',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: FlutterFlowTheme.of(context).primaryContainer,
                                                                  ),
                                                                ),
                                                                content: SizedBox(
                                                                  height: 220,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.all(16.0),
                                                                        child: FaIcon(
                                                                          // ignore: deprecated_member_use
                                                                          FontAwesomeIcons.circleExclamation,
                                                                          color: FlutterFlowTheme.of(context).primaryContainer,
                                                                          size: 100,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Deseja informar a devolução da obra',
                                                                        style: TextStyle(
                                                                          color: FlutterFlowTheme.of(context).primaryContainer,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                                        child: Container(
                                                                          width: double.infinity,
                                                                          height: 60,
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            livros[index]['nome'] + ' ?',
                                                                            style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: FlutterFlowTheme.of(context)
                                                                                    .primaryContainer),
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
                                                                    child: Text(
                                                                      'Cancelar',
                                                                      style: TextStyle(
                                                                          color: FlutterFlowTheme.of(context).alternate),
                                                                    ),
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
                                                                      style:
                                                                          TextStyle(color: FlutterFlowTheme.of(context).success),
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
