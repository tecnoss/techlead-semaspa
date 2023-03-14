import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/screens/previsao_tempo/card_data.dart';
import 'package:semasma/screens/previsao_tempo/model/city_data_model.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../../widgets/bottom_bar.dart';

class PrevisaoTempo extends StatefulWidget {
  const PrevisaoTempo({Key? key}) : super(key: key);

  @override
  State<PrevisaoTempo> createState() => _PrevisaoTempoState();
}

class _PrevisaoTempoState extends State<PrevisaoTempo> {
  List<CityData> cityData = [
    CityData(id: 1, regiao: "Região Metropolitana de Belém", label: "Belém"),
    CityData(id: 5, regiao: "Marabá", label: "Marabá"),
    CityData(id: 7, regiao: "Altamira", label: "Altamira"),
    CityData(id: 8, regiao: "Santarém", label: "Santarém"),
  ];

  String? formattedDate;

  CityData? selectedCity;

  @override
  void initState() {
    super.initState();
    selectedCity = cityData[0];
    getDate();
  }

  void getDate() async {
    // await initializeDateFormatting('pt_BR', '');
    DateTime now = DateTime.now();

    setState(
      () => {
        formattedDate =
            DateFormat('EEEE, dd \'de\' MMMM \'de\' y', 'pt_BR').format(now),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: "Previsão do Tempo",
        ),
        centerTitle: true,
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.height,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: appColorPrimary,
                            ),
                            Flexible(
                              child: Text(
                                "REGIÃO METROPOLITANA DE BELÉM",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: appColorPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        formattedDate ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  16.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Outras Cidades do Pará",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: appColorPrimary,
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: DropdownButton(
                          value: selectedCity,
                          onChanged: ((value) {
                            setState(() {
                              selectedCity = value;
                            });
                          }),
                          underline: Container(),
                          hint: const Text(
                            "Selecione",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          items: cityData.map((CityData city) {
                            return DropdownMenuItem<CityData>(
                              value: city,
                              child: Text(
                                city.regiao,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.height,
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 4 / 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CardData(
                    data: Column(
                      children: [
                        const Text(
                          "TEMPERATURA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: appColorPrimary,
                          ),
                        ),
                        const Divider(
                          color: appColorPrimary,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "30°C",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Máxima",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "24°C",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Mínima",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: appColorPrimary,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Flexible(
                              child: Text(
                                "Umidade relativa do ar",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            24.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.expand_less,
                                  size: 16,
                                ),
                                Text(
                                  "98%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.expand_more,
                                  size: 16,
                                ),
                                Text(
                                  "55%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CardData(
                    data: Column(
                      children: [
                        const Text(
                          "MANHÃ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: appColorPrimary,
                          ),
                        ),
                        const Divider(
                          color: appColorPrimary,
                          thickness: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/previsao_tempo/less_cloud.png",
                              height: 64,
                            ),
                            const Text("Poucas nuvens."),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CardData(
                    data: Column(
                      children: [
                        const Text(
                          "TARDE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: appColorPrimary,
                          ),
                        ),
                        const Divider(
                          color: appColorPrimary,
                          thickness: 1,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                    "assets/icons/previsao_tempo/thunder.png"),
                                height: 64,
                              ),
                              Flexible(
                                child: Text(
                                    "Parcialmente nublado e nublado com chuvas "
                                    "e trovoadas no final do período.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardData(
                    data: Column(
                      children: [
                        const Text(
                          "NOITE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: appColorPrimary,
                          ),
                        ),
                        const Divider(
                          color: appColorPrimary,
                          thickness: 1,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                    "assets/icons/previsao_tempo/heavy-rain.png"),
                                height: 64,
                              ),
                              Flexible(
                                child: Text(
                                  "Parcialmente nublado a poucas nuvens "
                                  "com possibilidade de chuvas rápidas e isoladas no "
                                  "início do período.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              16.height,
              Container(
                decoration: BoxDecoration(
                  color: appColorPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/previsao_tempo/sunrise.png",
                            height: 36,
                          ),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "NASCER DO SOL:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  4.width,
                                  const Text(
                                    "05:54:00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/previsao_tempo/sunset.png",
                            height: 36,
                          ),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "PÔR DO SOL:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                  4.width,
                                  const Text(
                                    "06:03:00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
