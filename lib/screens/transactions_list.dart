import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List>(
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => _webClient.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List transactions = snapshot.data ?? [];
              if (transactions.isNotEmpty) {
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];

                    return _TransactionItem(transaction!);
                  },
                );
              }
              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );
          }
          return CenteredMessage(
            'Unknow Error',
            icon: Icons.warning,
          );
        },
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction _transferencia;


  _TransactionItem(this._transferencia);

  @override
  Widget build(BuildContext context) {
    final String nome = _transferencia.contact.name.toString();
    final String conta = _transferencia.contact.accountNumber.toString();
    final String valor = _transferencia.value.toString();
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.people),
        title: Text('Nome: $nome'),
        subtitle: Text('Conta: $conta Valor: $valor'),
      ),
    );
  }
}
