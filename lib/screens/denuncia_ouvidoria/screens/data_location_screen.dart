import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/report_provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class DataLocationScreen extends StatefulWidget {
  const DataLocationScreen({super.key});

  @override
  State<DataLocationScreen> createState() => _DataLocationScreenState();
}

class _DataLocationScreenState extends State<DataLocationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _showConfirmationDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                size: 64,
                color: Colors.green,
              ),
              16.height,
              const Text(
                'Sua dunúncia foi enviada com sucesso!!!',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              48.height,
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    context.read<ReportProvider>().sendEmail(),
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   '/denuncia_ouvidoria',
                    // )
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<ReportProvider>().toString());
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenTitle(
                  title: 'Informe o que ocorreu?',
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Data do ocorrido:    /    /',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.calendar_month),
                  ],
                ),
                16.height,
                const Text(
                  'Mensagem do ocorrido:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _messageController,
                  keyboardType: TextInputType.multiline,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  maxLines: 15,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    hintText: 'Digite a mensagem do ocorrido',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                16.height,
                const Text(
                  'Anexar Fotos e/ou Arquivos:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.height,
                Row(
                  children: [
                    const Icon(
                      Icons.picture_as_pdf,
                      size: 36,
                      color: appColorPrimary,
                    ),
                    16.width,
                    const Icon(
                      Icons.collections,
                      size: 36,
                      color: appColorPrimary,
                    ),
                    16.width,
                    const Icon(
                      Icons.photo_camera,
                      size: 36,
                      color: appColorPrimary,
                    ),
                  ],
                ),
                32.height,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ReportProvider>().message =
                          _messageController.text;
                      context.read<ReportProvider>().date =
                          _dateController.text;
                      _showConfirmationDialog();
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
                      'Enviar',
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
      ),
    );
  }
}
