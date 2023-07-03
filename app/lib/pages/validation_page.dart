import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: SingleChildScrollView(
            child: Column(
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
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: DataTable2(
                            columnSpacing: 10,
                            horizontalMargin: 12,
                            columns: [
                              DataColumn2(
                                fixedWidth: 140,
                                label: SizedBox(
                                  width: 270,
                                  child: Text(
                                    'Matrícula',
                                    style: FlutterFlowTheme.of(context).labelLarge,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              DataColumn2(
                                // size: ColumnSize.values.first,
                                // fixedWidth: 200,
                                fixedWidth: 130,

                                label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Data do Pedido',
                                    style: FlutterFlowTheme.of(context).labelLarge,
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
                                    style: FlutterFlowTheme.of(context).labelLarge,
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
                                      validationQuests[index]['userReader'],
                                    ),
                                  ),
                                  DataCell(SizedBox(
                                    width: 100,
                                    child: Text(
                                      validationQuests[index]['dateRequest'],
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                  DataCell(SizedBox(
                                    width: 100,
                                    child: Text(
                                      (validationQuests[index]['status']) ? 'true' : 'falso', // Implementar botão para validar
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            headingRowColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).secondary,
                            ),
                            headingRowHeight: 56.0,
                            dataRowColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            dataRowHeight: 56.0,
                            border: TableBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            dividerThickness: 1.0,
                            showBottomBorder: true,
                            // minWidth: 49.0,
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
