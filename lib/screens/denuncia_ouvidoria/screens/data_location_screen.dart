import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/report_provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class PDFModel {
  final String name;
  final String path;
  late String id;

  PDFModel({
    required this.name,
    required this.path,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}

class ImageModel {
  final File image;
  late String id;

  ImageModel({
    required this.image,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}

class DataLocationScreen extends StatefulWidget {
  const DataLocationScreen({super.key});

  @override
  State<DataLocationScreen> createState() => _DataLocationScreenState();
}

class _DataLocationScreenState extends State<DataLocationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final List<PDFModel> _pdfName = [];
  final List<ImageModel> _imageFiles = [];

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
              Consumer<ReportProvider>(
                builder: (context, reportProvider, child) {
                  if (!reportProvider.isLoading &&
                      reportProvider.trySend &&
                      reportProvider.success) {
                    return const Icon(
                      Icons.check_circle,
                      size: 64,
                      color: Colors.green,
                    );
                  }

                  if (reportProvider.trySend && !reportProvider.success) {
                    return const Icon(
                      Icons.error,
                      size: 64,
                      color: Colors.red,
                    );
                  }

                  return Container();
                },
              ),
              16.height,
              Consumer<ReportProvider>(
                builder: (context, reportProvider, child) {
                  if (reportProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (reportProvider.trySend && !reportProvider.success) {
                    return const Text(
                      'Ocorreu um erro ao enviar sua denúncia, tente novamente mais tarde.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    );
                  }

                  return const Text(
                    'Sua denúncia foi enviada com sucesso!!!',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  );
                },
              ),
              48.height,
              SizedBox(
                height: 40,
                child: Consumer<ReportProvider>(
                  builder: (context, reportProvider, child) {
                    bool isLoading = reportProvider.isLoading;
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/home", (route) => false),
                              },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        isLoading ? 'Enviando...' : 'OK',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<PlatformFile?> _selectPdf() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (file == null) {
      return null;
    }

    return file.files.single;
  }

  Future<void> _selectImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);

    if (image == null) {
      return;
    }

    setState(() {
      _imageFiles.add(ImageModel(image: File(image.path)));
    });
  }

  Future<void> _deleteImage(String id) async {
    _showDialogConfirmation(
      title: 'Excluir imagem',
      message: 'Deseja realmente excluir a imagem?',
      onConfirm: () {
        setState(() {
          _imageFiles.removeWhere((element) => element.id == id);
        });
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> _deletePdf(String id) async {
    _showDialogConfirmation(
      title: 'Excluir PDF',
      message: 'Deseja realmente excluir o PDF?',
      onConfirm: () {
        setState(() {
          _pdfName.removeWhere((element) => element.id == id);
        });
        Navigator.of(context).pop();
      },
    );
  }

  void _showDialogConfirmation({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: onConfirm,
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
        centerTitle: true,
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Data do ocorrido:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        _dateController.text == ''
                            ? '       /       /      '
                            : _dateController.text,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: () async {
                        final DateTime? picked =
                            await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          maxTime: DateTime.now(),
                          theme: const DatePickerTheme(
                            headerColor: appColorPrimary,
                            backgroundColor: Colors.white,
                            itemStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            doneStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          locale: LocaleType.pt,
                        );
                        if (picked != null) {
                          String formatDate =
                              '${picked.toString().substring(8, 10)}/${picked.toString().substring(5, 7)}/${picked.toString().substring(0, 4)}';
                          setState(() {
                            _dateController.text = formatDate;
                          });
                        }
                      },
                    ),
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
                    IconButton(
                      onPressed: () async {
                        final file = await _selectPdf();

                        if (file != null) {
                          setState(() {
                            _pdfName.add(
                              PDFModel(name: file.name, path: file.path!),
                            );
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.picture_as_pdf,
                        size: 36,
                        color: appColorPrimary,
                      ),
                    ),
                    16.width,
                    IconButton(
                      onPressed: () async {
                        await _selectImage(ImageSource.gallery);
                      },
                      icon: const Icon(
                        Icons.collections,
                        size: 36,
                        color: appColorPrimary,
                      ),
                    ),
                    16.width,
                    IconButton(
                      onPressed: () async {
                        await _selectImage(ImageSource.camera);
                      },
                      icon: const Icon(
                        Icons.photo_camera,
                        size: 36,
                        color: appColorPrimary,
                      ),
                    ),
                  ],
                ),
                16.height,
                _pdfName.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Arquivos PDF anexados:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          8.height,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _pdfName.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.attach_file,
                                    color: appColorPrimary,
                                    size: 16,
                                  ),
                                  Text(
                                    _pdfName[index].name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  8.width,
                                  GestureDetector(
                                    onTap: () async {
                                      await _deletePdf(_pdfName[index].id);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Container(),
                16.height,
                _imageFiles.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                            Text(
                              'Imagens anexadas:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ])
                    : Container(),
                _imageFiles.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            _imageFiles.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: FileImage(
                                              _imageFiles[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await _deleteImage(
                                              _imageFiles[index].id);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
                32.height,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ReportProvider>().message =
                          _messageController.text;
                      context.read<ReportProvider>().date =
                          _dateController.text;

                      context
                          .read<ReportProvider>()
                          .sendEmail()
                          .then((value) => {debugPrint("sucesso")})
                          .catchError((onError) => {debugPrint(onError)});

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
