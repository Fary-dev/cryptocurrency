import 'package:crypto_app/model/big_data_model.dart';
import 'package:crypto_app/repository/repository.dart';
import 'package:crypto_app/widgets/coin_list_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<BigDataModel> _futureCoins;
  late Repository repository;

  @override
  void initState() {
    repository = Repository();
    _futureCoins = repository.getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BigDataModel>(
        future: _futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var coinsData = snapshot.data!.dataModel;
             return CoinListWidget(coins: coinsData);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
