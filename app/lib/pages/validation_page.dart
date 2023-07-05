import 'package:app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../assets/theme/flutter_flow_theme.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ValidationPageState createState() => _ValidationPageState();
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
bool isLoading = false;
List<Map<String, dynamic>> validationQuests = [];

class _ValidationPageState extends State<ValidationPage> {
  int linhas =
      10; // validationQuest.lenght | vQ[dateR] vQ[status] vQ[reader/Allowing] Disponibilidade não nprecisa ser uma valiavel real

  getValidation() async {
    List<Map<String, dynamic>> validations = [];
    setState(() {
      isLoading = true;
    });
    await firebaseFirestore.collection('validation').where('status', isEqualTo: false).get().then(
      (value) {
        for (var docSnapshot in value.docs) {
          validations.add(docSnapshot.data());
        }
      },
    ).onError((error, stackTrace) {
      print(
        // colocar algo melhor para indicar o error
        error,
      );
    });
    setState(() {
      isLoading = false;
    });
    return validations;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      validationQuests = await getValidation();
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
              color: FlutterFlowTheme.of(context).accent3,
            ),
          ),
          title: Text(
            'Validar usuários',
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
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() async {
                validationQuests = await getValidation();
              });
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
                                        style: FlutterFlowTheme.of(context).labelLarge.copyWith(fontSize: 16),
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
                                        style: FlutterFlowTheme.of(context).labelLarge.copyWith(fontSize: 14),
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
                                        style: FlutterFlowTheme.of(context).labelLarge.copyWith(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  validationQuests.length, // numero de linhas
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          validationQuests[index]['userReaderId'],
                                        ),
                                      ),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          validationQuests[index]['dateRequest'],
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: double.infinity,
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
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
                                                        const Text(
                                                            'Você confirma que esse cadastro é de um discente/docente do SMD?'),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            width: double.infinity,
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.rectangle,
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                            ),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              validationQuests[index]['userReaderId'],
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
                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                            ),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              validationQuests[index]['dateRequest'],
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
                                                        setState(() async {
                                                          await context.read<AuthService>().confirmValidation(
                                                              validationQuests[index]['userReaderId'], validationQuests[index]);
                                                          Navigator.pop(alertDialogContext, true);
                                                        });
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
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            backgroundColor: FlutterFlowTheme.of(context).accent3,
                                            foregroundColor: FlutterFlowTheme.of(context).tertiary,
                                            // textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                            //       fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                            //       color: FlutterFlowTheme.of(context).tertiary,
                                            //       fontSize: 16,
                                            //       useGoogleFonts:
                                            //           GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                            //     ),
                                            elevation: 2,
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.crisis_alert,
                                                size: 18,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Text('Validar'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                headingRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context).accent2,
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