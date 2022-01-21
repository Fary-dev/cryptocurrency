import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/model/chart_data.dart';
import 'package:crypto_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../widgets/extension.dart';

class CoinDetailScreen extends StatefulWidget {
  final DataModel coin;

  const CoinDetailScreen({Key? key, required this.coin}) : super(key: key);

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late bool favorite;

  List<bool> listYear = [true, false, false, false, false, false];

  @override
  void initState() {
    favorite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var coinIconUrl = 'https://cryptocurrencyliveprices.com/img/';
    Random random = Random();
    double next(int min, int max) => random.nextDouble();
    List<ChartData> data = [
      ChartData(next(1, 10000), 1),
      ChartData(next(1, 2200), 2),
      ChartData(next(1, 300), 3),
      ChartData(next(1, 10000), 4),
      ChartData(next(1, 1200), 5),
      ChartData(next(1, 150), 6),
      ChartData(next(1, 10000), 7),
      ChartData(next(1, 75), 8),
      ChartData(next(1, 580), 9),
      ChartData(next(1, 11111), 10),
      ChartData(next(1, 1000), 11),
      ChartData(next(1, 486), 12),
      ChartData(next(1, 11111), 13),
      ChartData(next(1, 3400), 14),
      ChartData(next(1, 459), 15),
      ChartData(next(1, 1000), 16),
      ChartData(next(1, 1290), 17),
      ChartData(next(1, 951), 18),
      ChartData(next(1, 357), 19),
      ChartData(next(1, 1100), 20),
    ];
    List<double> stops = [];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final List<Color> color = <Color>[];
    if (widget
        .coin
        .quoteModel
        .usdModel
        .percentChange_7d >= 0) {
      color.add(Colors.green[50]!);
      color.add(Colors.green[200]!);
      color.add(Colors.green);
    } else {
      color.add(Colors.red[50]!);
      color.add(Colors.red[200]!);
      color.add(Colors.red);
    }

    final LinearGradient gradientColors =
    LinearGradient(colors: color, stops: stops);

    return Scaffold(
      backgroundColor: const Color.fromARGB(11, 12, 54, 1),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.star,
              color: !favorite ? Colors.white54 : Colors.amber,
            ),
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
          ),
        ],
        title: Text(
          widget.coin.slug.capitalize().replace(),
          style: Theme
              .of(context)
              .textTheme
              .headline4,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.coin.quoteModel.usdModel.price
                                .toStringAsFixed(2) +
                                ' \$',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            (widget.coin.quoteModel.usdModel.percentChange_7d >=
                                0
                                ? '+'
                                : '') +
                                widget.coin.quoteModel.usdModel.percentChange_7d
                                    .toStringAsFixed(2) +
                                ' %',
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: widget.coin.quoteModel.usdModel
                                  .percentChange_7d >=
                                  0
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24),
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          imageUrl: (coinIconUrl +
                              (widget.coin.symbol
                                  .toLowerCase() == 'vgx'
                                  ? 'ethos'
                                  : widget.coin.symbol
                                  .toLowerCase() == 'waxp' ? 'wax' : widget.coin
                                  .symbol
                                  .toLowerCase()) +
                              '-' +
                              (widget.coin.slug.toLowerCase() ==
                                  'terra-luna'
                                  ? 'terra'
                                  : widget.coin.slug
                                  .toLowerCase() ==
                                  'polkadot-new'
                                  ? 'polkadot'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'crypto-com-coin'
                                  ? 'cryptocom-chain'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'multi-collateral-dai'
                                  ? 'dai'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'elrond-egld'
                                  ? 'elrond'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'hedera'
                                  ? 'hedera-hashgraph'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'theta'
                                  ? 'theta-token'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'unus-sed-leo'
                                  ? 'leo-token'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'aave'
                                  ? 'new'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'compound'
                                  ? 'compoundd'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'yearn-finance'
                                  ? 'yearnfinance'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'mina'
                                  ? 'mina-protocol'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'xinfin'
                                  ? 'xdc'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'paxos-standard'
                                  ? 'paxos-standard-token'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'wax'
                                  ? 'wax'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'immutable-x'
                                  ? 'internet-computer'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'voyager-token'
                                  ? 'ethos'
                                  : widget.coin
                                  .slug
                                  .toLowerCase() ==
                                  'omg'
                                  ? 'omg-network'
                                  : widget.coin
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
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 220,
                        width: double.infinity,
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(isVisible: false),
                          primaryYAxis: CategoryAxis(isVisible: false),
                          legend: Legend(isVisible: false),
                          tooltipBehavior: TooltipBehavior(enable: false),

                          series: <ChartSeries<ChartData, String>>[
                            AreaSeries<ChartData, String>(
                              dataSource: data,
                              xValueMapper: (ChartData data, _) =>
                                  data.year.toString(),
                              yValueMapper: (ChartData data, _) => data.value,
                              gradient: gradientColors,
                              /*pointColorMapper: (ChartData data, _) => widget
                                          .coin
                                          .quoteModel
                                          .usdModel
                                          .percentChange_7d >=
                                      0
                                  ? Colors.green
                                  : Colors.red,*/
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggleButtons(
                              borderRadius: BorderRadius.circular(12.0),
                              borderColor: Colors.white10,
                              color: Colors.white,
                              fillColor: Colors.green,
                              selectedColor: Colors.white,
                              selectedBorderColor: Colors.white10,
                              children: const [
                                Year('1H'),
                                Year('1D'),
                                Year('1W'),
                                Year('1M'),
                                Year('2M'),
                                Year('3M'),
                              ],
                              isSelected: listYear,
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < listYear.length; i++) {
                                    if (i == index) {
                                      listYear[i] = true;
                                    } else {
                                      listYear[i] = false;
                                    }
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.white10.withOpacity(0.2),
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Convert',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Support fast conversion between coins',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                  color: Colors.white24, fontSize: 10),
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white10,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Circulating Supply:',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                            Text(
                              widget.coin.circulationgSupplly.toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Max Supply:',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                            Text(
                              widget.coin.maxSuooly.toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Market pairs:',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                            Text(
                              widget.coin.numMarketPairs.toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Market Cap:',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                            Text(
                              widget.coin.quoteModel.usdModel.marketCap
                                  .toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Year extends StatelessWidget {
  final String title;

  const Year(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme
          .of(context)
          .textTheme
          .subtitle1,
    );
  }
}


