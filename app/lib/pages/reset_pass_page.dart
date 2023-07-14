import 'package:app/assets/theme/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isSendingResetLink = false;

  // Função para redefinir a senha usando Firebase
  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSendingResetLink = true;
      });
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text);
        _showResetPasswordSuccessDialog();
      } catch (error) {
        Fluttertoast.showToast(
            msg: 'Erro ao enviar e-mail de redefinição de senha: $error');
        _showResetPasswordErrorDialog();
      } finally {
        setState(() {
          _isSendingResetLink = false;
        });
      }
    }
  }

  void _showResetPasswordSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('E-mail de redefinição de senha enviado'),
          content: const Text(
              'Um link para redefinir sua senha foi enviado para o e-mail fornecido.'),
          actions: [
            OutlinedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showResetPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro ao enviar o e-mail de redefinição de senha'),
          content: const Text(
              'Ocorreu um erro ao enviar o e-mail de redefinição de senha. Tente novamente mais tarde.'),
          actions: [
            OutlinedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).onBackground),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        titleTextStyle: FlutterFlowTheme.of(context).displayLarge.override(
              fontFamily: FlutterFlowTheme.of(context).displayLargeFamily,
              color: FlutterFlowTheme.of(context).onBackground,
              fontSize: 24,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).displayLargeFamily),
            ),
        title: Text('Esqueci a senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um e-mail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: _isSendingResetLink ? null : _resetPassword,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 40),
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryContainer,
                  // foregroundColor: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        color: FlutterFlowTheme.of(context).onPrimaryContainer,
                        fontSize: 16,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                  elevation: 5,
                ),
                child: _isSendingResetLink
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(
                        'Enviar link de redefinição',
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
