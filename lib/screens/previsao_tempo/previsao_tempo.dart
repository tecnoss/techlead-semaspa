import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/screens/previsao_tempo/model/city_data_model.dart';
import 'package:semasma/screens/previsao_tempo/model/weather_model.dart';
import 'package:semasma/screens/previsao_tempo/widgets/weather_today.dart';
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
  final dio = Dio();
  final String baseUrl =
      "http://appmobile-integracao.semas.pa.gov.br:453/regiao/";
  Weather? weatherToday;
  List<Weather> pastWeathers = [];

  List<CityData> cityData = [
    CityData(id: 1, regiao: "Região Metropolitana de Belém", label: "Belém"),
    CityData(id: 5, regiao: "Marabá", label: "Marabá"),
    CityData(id: 7, regiao: "Altamira", label: "Altamira"),
    CityData(id: 8, regiao: "Santarém", label: "Santarém"),
  ];

  String? formattedDate;

  CityData? selectedCity;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getDate();
    updateValue(cityData[0]);
  }

  void getDate() async {
    DateTime now = DateTime.now();
    setState(
      () => {
        formattedDate =
            DateFormat('EEEE, dd \'de\' MMMM \'de\' y', 'pt_BR').format(now),
      },
    );
  }

  Future<void> updateValue(CityData value) async {
    if (value.id == selectedCity?.id) {
      return;
    }

    setState(() {
      selectedCity = value;
      loading = true;
    });

    await getCityData();

    setState(() {
      loading = false;
    });
    debugPrint("Mudou valor");
  }

  Future<void> getCityData() async {
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);

    try {
      final response = await dio.get(baseUrl + selectedCity!.id.toString());
      response.data["response"].forEach((element) {
        if (element["dia"].toString().contains(date)) {
          weatherToday = Weather.fromJson(element);
        } else {
          pastWeathers.add(Weather.fromJson(element));
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
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
                            updateValue(value as CityData);
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
              if (loading)
                const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else ...[
                const Text(
                  "Previsão para hoje",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: appColorPrimary,
                  ),
                ),
                const Divider(
                  color: appColorPrimary,
                  thickness: 1,
                ),
                8.height,
                weatherToday != null
                    ? WeatherToday(weather: weatherToday!)
                    : const Text(
                        "Não foi possível carregar os dados para hoje",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
              ],
              16.height,
              const Text(
                "Histórico de previsões",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: appColorPrimary,
                ),
              ),
              const Divider(
                color: appColorPrimary,
                thickness: 1,
              ),
              8.height,
              if (pastWeathers.isNotEmpty)
                Column(
                  children: const [],
                )
              else
                const Text(
                  "Não foi possível carregar o histórico",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
