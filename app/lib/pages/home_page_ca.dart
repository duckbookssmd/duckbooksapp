import 'package:app/pages/borrow_solicitations_page.dart';
import 'package:app/pages/register_book.dart';
import 'package:app/pages/register_loan_page.dart';
import 'package:app/pages/validation_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '/assets/theme/flutter_flow_theme.dart';
import '../widgets/duck_app_bar.dart';
import 'manage_users_page.dart';

class HomePageCa extends StatefulWidget {
  const HomePageCa({
    Key? key,
    this.viewType,
  }) : super(key: key);

  final List<String>? viewType;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageCaState createState() => _HomePageCaState();
}

bool isLoading = false;
List<Map<String, dynamic>> usersActions = [];
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class _HomePageCaState extends State<HomePageCa> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  getActions() async {
    List<Map<String, dynamic>> actions = [];
    setState(() {
      isLoading = true;
    });

    await firebaseFirestore.collection('logs').get().then(
      (value) async {
        for (var docSnapshot in value.docs) {
          var action = docSnapshot.data();
          // borrow.addAll({
          //   'userRegistration': await context.read<AuthService>().getRegistrationById(borrow['userLoan']),
          //   'codBook': await context.read<AuthService>().getCodById(borrow['bookBorrowed']),
          // });
          actions.add(action);
        }
      },
    ).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });

    setState(() {
      isLoading = false;
    });

    actions.sort(((a, b) => b['time'].compareTo(a['time'])));
    return actions;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      usersActions = await getActions();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  label: const Text('!'),
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
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                              child: Text(
                                'Funções Administrativas',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).onBackground,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => const ValidationPage())),
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width * 0.43,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryContainer,
                                            borderRadius: BorderRadius.circular(30),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.emoji_people_rounded,
                                                color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                size: 30,
                                              ),
                                              const SizedBox(width: 16),
                                              Text(
                                                'Validar\nusuário',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                      fontSize: 14,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 22),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const RegisterLoanPageWidget()));
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width * 0.43,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryContainer,
                                            borderRadius: BorderRadius.circular(30),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.assignment_add,
                                                color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                size: 28,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Registrar\nempréstimo',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                      fontSize: 14,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterBook()));
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width * 0.43,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryContainer,
                                            borderRadius: BorderRadius.circular(30),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.collections_bookmark,
                                                  color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                  size: 30,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Cadastrar\nobra',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                        color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                        fontSize: 14,
                                                        useGoogleFonts: GoogleFonts.asMap()
                                                            .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                      ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      const SizedBox(width: 22),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const ManageUsersPage()));
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width * 0.43,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryContainer,
                                            borderRadius: BorderRadius.circular(30),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.userGear,
                                                color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                size: 24,
                                              ),
                                              Text(
                                                'Gerenciar\nusuários',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                      color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                                      fontSize: 14,
                                                      useGoogleFonts: GoogleFonts.asMap()
                                                          .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                              child: Text(
                                'Histórico de Atividades',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).displayLarge.override(
                                      fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                                      color: FlutterFlowTheme.of(context).onBackground,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                                    ),
                              ),
                            ),
                          ),
                          RefreshIndicator(
                            onRefresh: () async {
                              usersActions = await getActions();
                              // print(usersActions);
                              setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                (isLoading)
                                    ? Center(
                                        child: Image.asset(
                                          'lib/assets/images/pato_girando.gif',
                                          width: 150,
                                        ),
                                      )
                                    : Container(
                                        width: double.infinity,
                                        height: 400.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(0.0),
                                        ),
                                        child: DataTable2(
                                          columnSpacing: 10,
                                          horizontalMargin: 22,
                                          minWidth: 100,
                                          columns: [
                                            DataColumn2(
                                              label: SizedBox(
                                                width: 101.5,
                                                child: Text(
                                                  'Ação',
                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                        color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                        useGoogleFonts: GoogleFonts.asMap()
                                                            .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              fixedWidth: 101.5,
                                            ),
                                            DataColumn2(
                                              // size: ColumnSize.values.first,
                                              label: SizedBox(
                                                width: 120,
                                                child: Text(
                                                  'Matrícula',
                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                        color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                        useGoogleFonts: GoogleFonts.asMap()
                                                            .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              fixedWidth: 95,
                                            ),
                                            DataColumn2(
                                              // size: ColumnSize.values.first,
                                              label: SizedBox(
                                                width: 120,
                                                child: Text(
                                                  'Detalhes',
                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                        fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                        color: FlutterFlowTheme.of(context).onTertiaryContainer,
                                                        useGoogleFonts: GoogleFonts.asMap()
                                                            .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              fixedWidth: 120,
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            usersActions.length, // numero de linhas
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(
                                                    usersActions[index]['action'],
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          useGoogleFonts: GoogleFonts.asMap()
                                                              .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                        ),
                                                  ),
                                                  onTap: () => showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: SizedBox(
                                                          height: 200,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              // trocar po RickText
                                                              Text(
                                                                'Ação: ${usersActions[index]['action']}',
                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                              ),
                                                              Text(
                                                                'Usuário que realizou: ${usersActions[index]['userId']}',
                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                              ),
                                                              (usersActions[index]['userAdmId'].toString() != 'null')
                                                                  ? Text(
                                                                      'Quem permitiu: ${usersActions[index]['userAdmId']}',
                                                                      style: FlutterFlowTheme.of(context).bodyLarge,
                                                                    )
                                                                  : const Padding(padding: EdgeInsets.all(0)),
                                                              Text(
                                                                'Livro: ${usersActions[index]['codBook']}',
                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                              ),
                                                              Text(
                                                                'Horário: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(
                                                                  int.parse(usersActions[index]['time']),
                                                                ))}',
                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actionsAlignment: MainAxisAlignment.center,
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: const Text('Cancelar'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                DataCell(Text(
                                                  usersActions[index]['userId'],
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                        useGoogleFonts: GoogleFonts.asMap()
                                                            .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                      ),
                                                  textAlign: TextAlign.center,
                                                )),
                                                DataCell(
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      (usersActions[index]['codBook'].toString() != 'null')
                                                          ? SizedBox(
                                                              width: 50,
                                                              child: IconButton(
                                                                onPressed: () async {
                                                                  Fluttertoast.showToast(
                                                                      msg: usersActions[index]['codBook'].toString());
                                                                },
                                                                icon: const Icon(
                                                                  Icons.newspaper,
                                                                  size: 26,
                                                                ),
                                                              ),
                                                            )
                                                          : const SizedBox(
                                                              width: 50,
                                                            ),
                                                      SizedBox(
                                                        width: 50,
                                                        child: IconButton(
                                                          onPressed: () async {
                                                            Fluttertoast.showToast(
                                                                msg: DateFormat('dd/MM/yyyy HH:mm').format(
                                                                    DateTime.fromMillisecondsSinceEpoch(
                                                                        int.parse(usersActions[index]['time']))));
                                                          },
                                                          icon: const Icon(
                                                            Icons.timer,
                                                            size: 26,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          headingRowColor: MaterialStateProperty.all(
                                            FlutterFlowTheme.of(context).tertiaryContainer,
                                          ),
                                          headingRowHeight: 56.0,
                                          dataRowColor: MaterialStateProperty.all(
                                            FlutterFlowTheme.of(context).onTertiaryContainer,
                                          ),
                                          dataRowHeight: 56.0,
                                          dividerThickness: 1.0,
                                          showBottomBorder: true,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
