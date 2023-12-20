import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController controller = TextEditingController(
      text:
          "A certificação de metodologias que nos auxiliam a lidar com a estrutura atual da organização ainda não demonstrou convincentemente que vai participar na mudança das posturas dos órgãos dirigentes com relação às suas atribuições. Do mesmo modo, o comprometimento entre as equipes oferece uma interessante oportunidade para verificação das novas proposições.");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Auto size text'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              TextField(
                controller: controller,
                maxLines: 5,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: AutoSizeText(
                    controller.text,
                    maxLines: 3,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
