import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../repository/report_provider.dart';
import '../widgets/radio_item.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<RadioModel> sampleData = <RadioModel>[
    RadioModel(false, 'Sim'),
    RadioModel(false, 'Não'),
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future _showModalConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.info, color: Colors.orange, size: 60),
              const SizedBox(height: 16),
              const Text(
                'As denúncias relatadas sem identificação não são passíveis de feedback, sendo assim você não será informado sobre a conclusão da apuração deste fato. Deseja realmente prosseguir como Relator Anônimo?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Não",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text(
                      "Sim",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'Ouvidoria'),
        leading: const Leading(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ScreenTitle(title: 'Você deseja se identificar?'),
              const Text(
                'Selecione se deseja ou não se identificar',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          for (var element in sampleData) {
                            element.isSelected = false;
                          }
                          sampleData[0].isSelected = true;
                          _nameController.text = '';
                        });
                      },
                      child: RadioItem(sampleData[0], appColorPrimary),
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          for (var element in sampleData) {
                            element.isSelected = false;
                          }
                          sampleData[1].isSelected = true;
                          _nameController.text = 'Relator Anônimo';
                          _emailController.text = '';
                        });
                      },
                      child: RadioItem(sampleData[1], Colors.red),
                    ),
                  ),
                ],
              ),
              16.height,
              TextFormField(
                controller: _nameController,
                enabled: sampleData[0].isSelected,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nome:',
                  hintText: 'Digite o seu nome completo',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              16.height,
              sampleData[0].isSelected
                  ? TextFormField(
                      controller: _emailController,
                      enabled: sampleData[0].isSelected,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'E-mail:',
                        hintText: 'Digite o seu e-mail',
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Container(),
              56.height,
              ElevatedButton(
                onPressed: () async {
                  if (sampleData[1].isSelected) {
                    bool result = await _showModalConfirmation(context);

                    if (result) {
                      context.read<ReportProvider>().identification =
                          _nameController.text;
                      Navigator.pushNamed(
                          context, '/denuncia_ouvidoria/location');
                    }

                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    context.read<ReportProvider>().identification =
                        _nameController.text;
                    context.read<ReportProvider>().email =
                        _emailController.text;
                    Navigator.pushNamed(
                        context, '/denuncia_ouvidoria/location');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Prosseguir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
