import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Cadastrando Cliente';
const _rotuloCampoName = 'Name:';
const _dicaCampoName = 'Sr(a)....';
const _rotuloCampoAccountNumber = 'Account Number:';
const _dicaCampoAccountNumber = 'xxxx';
const _textoBotaoConfirmar = 'Confirmar';

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactFormState();
  }
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _nameController,
              rotulo: _rotuloCampoName,
              dica: _dicaCampoName,
              icone: Icons.people,
            ),
            Editor(
              controlador: _accountNumberController,
              rotulo: _rotuloCampoAccountNumber,
              dica: _dicaCampoAccountNumber,
              icone: Icons.phone,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(_textoBotaoConfirmar),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final newContact = Contact(0, name, accountNumber!);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
