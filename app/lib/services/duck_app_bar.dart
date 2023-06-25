import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../flutter_flow_theme.dart';
import 'auth_service.dart';

class DuckAppBar extends StatelessWidget {
  const DuckAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          elevation: 16,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1, -1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        if (scaffoldKey!.currentState!.isDrawerOpen || scaffoldKey!.currentState!.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 24.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.power_settings_new_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText, //
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Sair do app',
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            context.read<AuthService>().logout(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.logout,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Fazer logout',
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
