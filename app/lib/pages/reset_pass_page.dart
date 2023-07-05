import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
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
        print('Erro ao enviar e-mail de redefinição de senha: $error');
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
          title: Text('E-mail de redefinição de senha enviado'),
          content: Text(
              'Um link para redefinir sua senha foi enviado para o e-mail fornecido.'),
          actions: [
            OutlinedButton(
              child: Text('OK'),
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
          title: Text('Erro ao enviar o e-mail de redefinição de senha'),
          content: Text(
              'Ocorreu um erro ao enviar o e-mail de redefinição de senha. Tente novamente mais tarde.'),
          actions: [
            OutlinedButton(
              child: Text('OK'),
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
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              OutlinedButton(
                child: _isSendingResetLink
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text('Enviar link de redefinição'),
                onPressed: _isSendingResetLink ? null : _resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
