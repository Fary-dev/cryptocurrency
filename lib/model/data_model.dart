import 'quote_model.dart';

class DataModel {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final String dateAdded;
  final List<dynamic> tags;
  final int maxSuooly;
  final num circulationgSupplly;
  final num totalSupplly;
  final int cmcRank;
  final String lastUpdated;
  final QuoteModel quoteModel;

  DataModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSuooly,
    required this.circulationgSupplly,
    required this.totalSupplly,
    required this.cmcRank,
    required this.lastUpdated,
    required this.quoteModel,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      slug: json['slug'],
      numMarketPairs: json['num_market_pairs'],
      dateAdded: json['date_added'],
      tags: json['tags'],
      maxSuooly: json['max_supply']??0,
      circulationgSupplly: json['circulating_supply'],
      totalSupplly: json['total_supply'],
      cmcRank: json['cmc_rank']??0,
      lastUpdated: json['last_updated']??'not last updated',
      quoteModel: QuoteModel.fromJson(
        json['quote'],
      ),
    );
  }
}
