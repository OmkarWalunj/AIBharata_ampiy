import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class Ampiy extends StatefulWidget {
  @override
  State<Ampiy> createState() => _Ampiy();
}

class _Ampiy extends State<Ampiy>{
    int _selectedIndex = 2;
    final PageController _pageController = PageController(initialPage: 2);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  late WebSocketChannel channel;
  List<Map<String, dynamic>> coinDataList = [];

  @override
  void initState() {
    super.initState();

    // Connect to the WebSocket
    channel = WebSocketChannel.connect(
      Uri.parse('ws://prereg.ex.api.ampiy.com/prices'),
    );

    // Subscribe to the ticker data
    channel.sink.add(jsonEncode({
      "method": "SUBSCRIBE",
      "params": ["all@ticker"],
      "cid": 1,
    }));

    // Listen to the WebSocket stream
    channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);

      if (decodedMessage['stream'] == "all@fpTckr") {
        setState(() {
          // Update the coin data list
          coinDataList = List<Map<String, dynamic>>.from(decodedMessage['data']);
          //developer.log('Coin Data List: ${coinDataList.toString()}', name: 'AmpiyDataFeed');
        });
      }
    });
  }
 List<String> coinLogos = [
  'https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=025', // Bitcoin
  'https://cryptologos.cc/logos/ethereum-eth-logo.png?v=025', // Ethereum
 // Ripple
  'https://cryptologos.cc/logos/litecoin-ltc-logo.png?v=025', // Litecoin
  'https://cryptologos.cc/logos/cardano-ada-logo.png?v=025', // Cardano // Polkadot // Binance Coin
  'https://cryptologos.cc/logos/chainlink-link-logo.png?v=025', // Chainlink // Tezos
  'https://cryptologos.cc/logos/monero-xmr-logo.png?v=025', // Monero
  'https://cryptologos.cc/logos/bitcoin-cash-bch-logo.png?v=025', // Bitcoin Cash
  'https://cryptologos.cc/logos/vechain-vet-logo.png?v=025', // VeChain
  'https://cryptologos.cc/logos/neo-neo-logo.png?v=025', // NEO
  'https://cryptologos.cc/logos/qtum-qtum-logo.png?v=025', // Qtum
  'https://cryptologos.cc/logos/tron-trx-logo.png?v=025', // TRON
  'https://cryptologos.cc/logos/zcash-zec-logo.png?v=025', // Zcash
  'https://cryptologos.cc/logos/crypto-com-coin-cro-logo.png?v=025', // Crypto.com Coin
  'https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=025', // Dogecoin
  'https://cryptologos.cc/logos/solana-sol-logo.png?v=025', // Solana
];

  @override
  void dispose() {
    // Close the WebSocket connection when the widget is disposed
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        appBar: AppBar( 
          backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
          actions: const[ 
            Icon(Icons.notifications,color: Colors.white,),
            SizedBox( 
              width: 20,
            )
          ],
        ),
       
        body:  PageView(
        controller: _pageController,
        children: <Widget>[
    body1(),


        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
       
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
 backgroundColor:const Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(FontAwesomeIcons.coins), label: 'Coins'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: CircleAvatar( 
              backgroundColor: Color.fromARGB(255, 3, 138, 248),
              child: Icon(FontAwesomeIcons.exchangeAlt,color: Colors.white,),
            ),label: ''),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.person_outline), label: 'You'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:Color.fromARGB(255, 3, 138, 248),
        unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
        unselectedLabelStyle: GoogleFonts.abel( 
          color: const Color.fromRGBO(157, 178, 206, 1),
          fontWeight: FontWeight.w400,
          fontSize: 12
        ),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
  
  Widget body1() {
    return SingleChildScrollView(
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 
            Column(
              children: [
                IconButton(onPressed:  (){}, icon:Icon( Icons.add_circle,size: 30,color: Color.fromARGB(255, 3, 138, 248),)),
                const Text("Buy",style: TextStyle(color: Colors.white),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed:  (){}, icon:Icon( Icons.remove_circle,size: 30,color: Color.fromARGB(255, 3, 138, 248),)),
                const Text("Sell",style: TextStyle(color: Colors.white),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed:  (){}, icon:Icon( Icons.person,size: 30,color: Color.fromARGB(255, 3, 138, 248),)),
                const Text("Referral",style: TextStyle(color: Colors.white),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed:  (){}, icon:Icon( Icons.video_collection,size: 30,color: Color.fromARGB(255, 3, 138, 248),)),
                const Text("Tutorial",style: TextStyle(color: Colors.white),)
              ],
            ),
          ],),
          const SizedBox( 
            height: 20,
          ),
          Padding(
          padding:  EdgeInsets.all(8),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text( "Coins",style: TextStyle( 
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),),
              coinDataList.isNotEmpty
            ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: coinDataList.length,
                itemBuilder: (context, index) {
                  final coinData = coinDataList[index];
                  final priceChangePercent = double.tryParse(coinData['P']) ?? 0.0;
                  return ListTile(
                  leading: index <14 ? Image.network(
                    coinLogos[index],
                    width: 40,
                    height: 40,
                  ): Image.network(
                    coinLogos[0],
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    coinData['s'], // Symbol of the coin
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle: Text('${coinData['c']}',style: TextStyle(color: Colors.white),),
                  trailing: Container(
                    height: 30,
                    decoration: BoxDecoration( 
                      border: Border.all(color: Colors.white)
                    ),
                    child: Text(
                      ' ${priceChangePercent.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: double.parse(coinData['p']) < 0 ? Colors.red : Colors.green,
                        fontSize: 15
                      ),
                    ),
                  ),
                );
                },
              )
            : Center(child: CircularProgressIndicator()),
            ],
          ),)
        
        ],
      ),
    );
  }
}