import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class AboutSemasScreen extends StatelessWidget {
  const AboutSemasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'Sobre a SEMAS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1 - O que é a Semas?',
                style: boldTextStyle(),
              ),
              8.height,
              const Text(
                'A Semas é a Secretaria de Estado de Meio Ambiente e Sustentabilidade, órgão da administração direta do Governo do Estado do Pará e atua como órgão seccional do Sistema Nacional do Meio Ambiente - Sisnama, e no âmbito do estado atua como o órgão central do Sistema Estadual de Meio Ambiente e Recursos Hídricos - Sisema, cuja atuação está voltada para observância e o cumprimento de sua finalidade institucional, conforme a Lei Estadual nº 5.752, de 26 de julho de 1993.',
              ),
              24.height,
              Text(
                '2 - Quando a Semas foi criada?',
                style: boldTextStyle(),
              ),
              8.height,
              const Text(
                'A Semas - Secretaria de Estado de Meio Ambiente e Sustentabilidade, foi criada pela Lei Estadual nº 5.457, de 11 de maio de 1988, com a denominação de Secretaria de Estado de Ciência, Tecnologia e Meio Ambiente – SECTAM, foi reorganizada pela Lei nº 5.752, de 26 de julho de 1993 e pela Lei nº 7.026, de 30 de julho de 2007, a qual foi desmembrada da Ciência e Tecnologia, ficando apenas com o título de Meio Ambiente. Por meio da Lei nº 8.096, de 1º de janeiro de 2015, recebeu a inclusão da palavra Sustentabilidade e chegou à nomenclatura atual da Secretaria. Foi por meio das Leis Estaduais nº 8.633, de 19 de junho de 2018, nº 9.048, de 29 de abril de 2020, e nº 9.575, de 11 de maio de 2022, que recebeu suas últimas alterações em sua estrutura organizacional.',
              ),
              24.height,
              Text(
                '3 - Qual a finalidade da Semas?',
                style: boldTextStyle(),
              ),
              8.height,
              const Text(
                'A Semas tem por finalidade, planejar, organizar, coordenar, controlar e avaliar as ações a cargo do Estado, que visem à proteção, à defesa, à conservação e à melhoria do meio ambiente e dos recursos hídricos, promovendo a gestão descentralizada, democrática e eficiente, através da coordenação da execução das Políticas Estaduais do Meio Ambiente e dos Recursos Hídricos. Além disso, a Semas é responsável por propor diretrizes, normas, critérios e padrões para a proteção, preservação e conservação do meio ambiente; por definir políticas específicas para a conservação de florestas e recursos extrativistas; por exercer o poder de polícia ambiental, realizando a aplicação de normas e padrões ambientais e do licenciamento, bem como efetuando a fiscalização ambiental; por promover a educação ambiental em todos os níveis e estimular a participação da comunidade no processo de preservação e recuperação do meio ambiente. A competência da SEMAS detalhada, foi estabelecida pela Lei Estadual nº 5.752, de 26 de julho de 1993, que dispõe sobre a estrutura da Administração Pública do Poder Executivo Estadual, e dá outras providências.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
