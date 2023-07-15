import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '/assets/theme/flutter_flow_theme.dart';
import '../widgets/duck_app_bar.dart';
import 'borrow_solicitations_page.dart';
import 'collection_details_page.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReservationsPageState createState() => _ReservationsPageState();
}

TextEditingController? searchController = TextEditingController();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

List livros = [];

bool isLoading = false;

class _ReservationsPageState extends State<ReservationsPage> {
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
        .then((value) async {
      List lista = [];
      for (var docSnapshot in value.docs) {
        Map<String, dynamic> livro = docSnapshot.data();
        if (!(livro['isDeleted'].toString() == 'true')) {
          await context.read<AuthService>().hasReservation(livro['codigo']) &&
                  await context.read<AuthService>().isReservationUser(livro['codigo'])
              ? lista.add(livro)
              : null;
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
                    'Minhas Reservas',
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
                                  child: Text('Você não reservou nenhuma obra!!'),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(-1, -1),
                                          child: Padding(
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
                                                    truncateWithEllipsis(20, livros[index]['nome']),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).headlineLarge,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: const AlignmentDirectional(-1, 0),
                                                  child: Text(
                                                    'Autor: ${truncateWithEllipsis(22, livros[index]['autor'])}',
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
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    (livros[index]['userloan'].toString() == 'null')
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
                                                                // TODO Continuar a ajeitar as partes dos cards
                                                                'Disponível',
                                                                style: FlutterFlowTheme.of(context).labelLarge,
                                                              ),
                                                              const SizedBox(width: 27),
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
                                                                'Indisponível',
                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                              ),
                                                              const SizedBox(width: 18),
                                                            ],
                                                          ),
                                                    Align(
                                                      alignment: const AlignmentDirectional(0, 1),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 16.0,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                top: 16.0,
                                                              ),
                                                              child: TextButton(
                                                                onPressed: () async {
                                                                  Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          CollectionDetailsPage(book: livros[index]),
                                                                    ),
                                                                  ).whenComplete(
                                                                      () => searchByName(searchController?.text ?? ''));
                                                                },
                                                                style: OutlinedButton.styleFrom(
                                                                  fixedSize: const Size(120, 40),
                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiaryContainer,
                                                                  elevation: 3,
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                                  shape: const StadiumBorder(
                                                                      side: BorderSide(color: Colors.transparent, width: 3.5)),
                                                                  // shape: ,
                                                                ),
                                                                child: Text(
                                                                  'Detalhes',
                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                        color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                                            FlutterFlowTheme.of(context).titleLargeFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
