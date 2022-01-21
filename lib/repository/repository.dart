import 'package:crypto_app/model/big_data_model.dart';
import 'package:dio/dio.dart';

class Repository {
  static String mainUrl = 'http://pro-api.coinmarketcap.com/v1/';
  final String apiKey = 'c165b4c5-e348-4577-8302-17df45918872';
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  final Dio _dio = Dio();
  Future<BigDataModel> getCoins() async {
    try {
      _dio.options.headers['X-CMC_PRO_API_KEY'] = apiKey;
      Response response = await _dio.get(currencyListingAPI);
      return BigDataModel.fromJson(response.data);
    } catch (error, stackTrace) {
      print('exeption $error  , dd $stackTrace');
      return BigDataModel.withError('eerroor');
    }
  }
}
