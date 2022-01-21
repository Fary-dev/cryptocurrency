import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/model/chart_data.dart';
import 'package:crypto_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../screens/coin_detail_screen.dart';
import '../widgets/extension.dart';

class CoinListWidget extends StatelessWidget {
  final List<DataModel> coins;

  const CoinListWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coinIconUrl = 'https://cryptocurrencyliveprices.com/img/';
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 16.0),
              child: Text(
                'Crypto Currency',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemExtent: 60.0,
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      List<ChartData> data = [
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_1h,
                            1700),
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_24h,
                            2160),
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_7d,
                            1860),
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_30d,
                            1245),
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_60d,
                            54),
                        ChartData(
                            coins[index].quoteModel.usdModel.percentChange_90d,
                            890),
                      ];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CoinDetailScreen(coin: coins[index])));
                        },
                        child: Container(
                          height: 55.0,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.indigo,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white24),
                                      padding: const EdgeInsets.all(2.0),
                                      child: CachedNetworkImage(
                                        // imageUrl: (coinIconUrl+coins[index].symbol+'.png'.toLowerCase()),
                                        imageUrl: (coinIconUrl +
                                            (coins[index].symbol
                                                .toLowerCase() == 'vgx'
                                                ? 'ethos'
                                                : coins[index].symbol
                                                .toLowerCase()=='waxp'?'wax':coins[index].symbol
                                                .toLowerCase()) +
                                            '-' +
                                            (coins[index].slug.toLowerCase() ==
                                                'terra-luna'
                                                ? 'terra'
                                                : coins[index].slug
                                                .toLowerCase() ==
                                                'polkadot-new'
                                                ? 'polkadot'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'crypto-com-coin'
                                                ? 'cryptocom-chain'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'multi-collateral-dai'
                                                ? 'dai'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'elrond-egld'
                                                ? 'elrond'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'hedera'
                                                ? 'hedera-hashgraph'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'theta'
                                                ? 'theta-token'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'unus-sed-leo'
                                                ? 'leo-token'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'aave'
                                                ? 'new'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'compound'
                                                ? 'compoundd'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'yearn-finance'
                                                ? 'yearnfinance'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'mina'
                                                ? 'mina-protocol'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'xinfin'
                                                ? 'xdc'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'paxos-standard'
                                                ? 'paxos-standard-token'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'wax'
                                                ? 'wax'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'immutable-x'
                                                ? 'internet-computer'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'voyager-token'
                                                ? 'ethos'
                                                : coins[index]
                                                .slug
                                                .toLowerCase() ==
                                                'omg'
                                                ? 'omg-network'
                                                : coins[index]
                                                .slug
                                                .toLowerCase()) +
                                            '.png'),

                                        placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                                'assets/icons/dollar.svg'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14.0,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          coins[index].symbol,
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Text(
                                          coins[index].slug.capitalize()
                                              .replace(),
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.transparent,
                                  height: 50,
                                  width: 80,
                                  child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: CategoryAxis(
                                        isVisible: false),
                                    primaryYAxis: CategoryAxis(
                                        isVisible: false),
                                    legend: Legend(isVisible: false),
                                    tooltipBehavior: TooltipBehavior(
                                        enable: false),
                                    series: <ChartSeries<ChartData, String>>[
                                      LineSeries<ChartData, String>(
                                        dataSource: data,
                                        xValueMapper: (ChartData data, _) =>
                                            data.year.toString(),
                                        yValueMapper: (ChartData data, _) =>
                                        data.value,
                                        pointColorMapper: (ChartData data, _) =>
                                        coins[index]
                                            .quoteModel
                                            .usdModel
                                            .percentChange_7d >=
                                            0
                                            ? Colors.green
                                            : Colors.red,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Text(
                                      coins[index]
                                          .quoteModel
                                          .usdModel
                                          .price
                                          .toStringAsFixed(2) +
                                          ' \$',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .subtitle1,
                                    ),
                                    Text(
                                      (coins[index]
                                          .quoteModel
                                          .usdModel
                                          .percentChange_7d >=
                                          0
                                          ? '+'
                                          : '') +
                                          coins[index]
                                              .quoteModel
                                              .usdModel
                                              .percentChange_7d
                                              .toStringAsFixed(2) +
                                          ' %',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                        fontSize: 11,
                                        color: coins[index]
                                            .quoteModel
                                            .usdModel
                                            .percentChange_7d >=
                                            0
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
