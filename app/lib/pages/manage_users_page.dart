import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';

class ManageUsersPage extends StatefulWidget {
  const ManageUsersPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ManageUsersPageState createState() => _ManageUsersPageState();
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
bool isLoading = false;
/// Lista de informaçãoes de usuários validados.
List<Map<String, dynamic>> usersData = [];

class _ManageUsersPageState extends State<ManageUsersPage> {

  /// Atualiza a lista de informações usuários validados
  getUserData() async {
    List<Map<String, dynamic>> users = [];
    setState(() {
      isLoading = true;
    });

    await firebaseFirestore
        .collection('user')
        .where('validated', isEqualTo: true)
        .get()
        .then(
      (value) async {
        for (var docSnapshot in value.docs) {
          var user = docSnapshot.data();
          user.addAll(
            {
              "books":
                  context.read<AuthService>().listBorrowNow(user["userLoans"]),
              "isOverdue": await context
                  .read<AuthService>()
                  .checkOverdue(user["userLoans"])
            },
          );
          users.add(user);
          await context.read<AuthService>().checkOverdue(user["userLoans"]);
        }
      },
    ).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });

    setState(() {
      isLoading = false;
    });
    users.sort(((a, b) => a['isOverdue']
        .toString()
        .length
        .compareTo(b['isOverdue'].toString().length)));
    return users;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      usersData = await getUserData();
    });
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
            'Gerenciar Usuários',
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                  color: FlutterFlowTheme.of(context).onBackground,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).displayLargeFamily),
                ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {
              usersData = await getUserData();
              setState(() {});
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    (isLoading)
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 16, end: 8, start: 8),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.86,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: DataTable2(
                                columnSpacing: 10,
                                horizontalMargin: 10,
                                sortAscending: true,
                                columns: [
                                  DataColumn2(
                                    fixedWidth: 135,
                                    label: SizedBox(
                                      width: 270,
                                      child: Text(
                                        'Matrícula',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onSecondaryContainer,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    // size: ColumnSize.values.first,
                                    // fixedWidth: 200,
                                    fixedWidth: 125,

                                    label: SizedBox(
                                      width: 105,
                                      child: Text(
                                        '',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .copyWith(fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    // size: ColumnSize.values.first,
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Contato',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onSecondaryContainer,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  usersData.length, // numero de linhas
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: double.infinity,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2),
                                            child: Text(
                                              usersData[index]
                                                  ['matriculaSIAPE'],
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        onTap: () => showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Matrícula ${usersData[index]['matriculaSIAPE']}"),
                                              content: SizedBox(
                                                height: 300,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // trocar po RickText
                                                    Text(
                                                      'Validação: ${usersData[index]['validated']}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Text(
                                                      'Email: ${usersData[index]['email']}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Text(
                                                      'Id: ${usersData[index]['uId']}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Text(
                                                      'Livros Alugados: ${(usersData[index]['userLoans'].toString() == '[]') ? "Sem empréstimos" : usersData[index]['books']}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                    Text(
                                                      'Possui atrasos: ${(usersData[index]['isOverdue']) ? 'Sim' : 'Não'}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: const Text('Cancelar'),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          (usersData[index]['isOverdue'])
                                              ? 'Atraso'
                                              : '',
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                            // TODO abrir um popup para ver o email e cópiar ele
                                            Clipboard.setData(ClipboardData(
                                                    text: usersData[index]
                                                        ['email']))
                                                .then((value) {
                                              //only if ->
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Copiado com sucesso'),
                                                // action: SnackBarAction(
                                                //   label: 'desfazer',
                                                //   onPressed: () {},
                                                // ),
                                              ));
                                            });
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => RegisterLoanPageWidget(
                                            //       userRegistration: borrowQuests[index]['userRegistration'],
                                            //       codBook: borrowQuests[index]['codBook'],
                                            //     ),
                                            //   ),
                                            // );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 0),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryContainer,
                                            foregroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .onSecondaryContainer,
                                            elevation: 2,
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.email,
                                                size: 18,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text('Email'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                headingRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context)
                                      .secondaryContainer,
                                ),
                                headingRowHeight: 56.0,
                                dataRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                dataRowHeight: 56.0,
                                border: TableBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                dividerThickness: 1.0,
                                showBottomBorder: true,
                                // minWidth: 49.0,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
