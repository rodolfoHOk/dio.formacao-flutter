import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/card_detail.dart';
// import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: const CustomAppBar(title: "Meu App"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    cardDetail.url,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  cardDetail.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    cardDetail.text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
