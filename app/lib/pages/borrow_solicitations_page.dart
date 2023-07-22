import 'package:app/pages/register_loan_page.dart';
import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';

class BorrowSolicitationsPage extends StatefulWidget {
  const BorrowSolicitationsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BorrowSolicitationsPageState createState() => _BorrowSolicitationsPageState();
}
/// Instancia doo Firebase (Talvez não devesse está aqui e sim no services.
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
bool isLoading = false;
/// Lista de requisições de empréstimo.
List<Map<String, dynamic>> borrowQuests = [];

class _BorrowSolicitationsPageState extends State<BorrowSolicitationsPage> {
  /// Atualiza lista de solicitações de empréstimo.
  /// 
  /// Procura no Firestore por empréstimos com o status "Solicitado" e os acrescenta na lista [borrowQuests]
  getSolicitations() async {
    List<Map<String, dynamic>> borrows = [];
    setState(() {
      isLoading = true;
    });

    await firebaseFirestore.collection('emprestimo').where('status', isEqualTo: 'Solicitado').get().then(
      (value) async {
        for (var docSnapshot in value.docs) {
          var borrow = docSnapshot.data();
          borrow.addAll({
            'userRegistration': await context.read<AuthService>().getRegistrationById(borrow['userLoan']),
            'codBook': await context.read<AuthService>().getCodById(borrow['bookBorrowed']),
          });
          borrows.add(borrow);
        }
      },
    ).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });

    setState(() {
      isLoading = false;
    });
    return borrows;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      borrowQuests = await getSolicitations();
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
            'Solicitações de Empréstimo',
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
                  color: FlutterFlowTheme.of(context).onBackground,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
                ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {
              borrowQuests = await getSolicitations();
              setState(() {});
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    (isLoading)
                        ? Center(
                            child: Image.asset(
                              'lib/assets/images/pato_girando.gif',
                              width: 150,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsetsDirectional.only(top: 16, end: 8, start: 8),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.86,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: DataTable2(
                                columnSpacing: 10,
                                horizontalMargin: 12,
                                columns: [
                                  DataColumn2(
                                    fixedWidth: 135,
                                    label: SizedBox(
                                      width: 270,
                                      child: Text(
                                        'Matrícula',
                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                              color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                            ),
                                        textAlign: TextAlign.start,
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
                                        'Data do Pedido',
                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                              color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    // size: ColumnSize.values.first,
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Status',
                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                              fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                              color: FlutterFlowTheme.of(context).onSecondaryContainer,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  borrowQuests.length, // numero de linhas
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          borrowQuests[index]['userRegistration'],
                                        ),
                                      ),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          borrowQuests[index]['loanDate'],
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => RegisterLoanPageWidget(
                                                  userRegistration: borrowQuests[index]['userRegistration'],
                                                  codBook: borrowQuests[index]['codBook'],
                                                ),
                                              ),
                                            );
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            backgroundColor: FlutterFlowTheme.of(context).secondaryContainer,
                                            foregroundColor: FlutterFlowTheme.of(context).onSecondaryContainer,
                                            elevation: 2,
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Icon(
                                              //   Icons.crisis_alert,
                                              //   size: 18,
                                              // ),
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text('Confirmar'), // TODO Colocar opção de negar
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                headingRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context).secondaryContainer,
                                ),
                                headingRowHeight: 56.0,
                                dataRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context).secondaryBackground,
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
