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
  final int size;
  late String id;

  PDFModel({
    required this.name,
    required this.path,
    required this.size,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}

class ImageModel {
  final File image;
  late String id;
  final int size;
  final String path;

  ImageModel({
    required this.image,
    required this.size,
    required this.path,
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
  final int limitSize = 20971000;
  int totalSize = 0;

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

                  if (reportProvider.trySend &&
                      !reportProvider.success &&
                      !reportProvider.sending) {
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
                    bool isError = reportProvider.isError;
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => {
                                if (isError)
                                  {
                                    Navigator.of(context).pop(),
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Ocorreu um erro ao enviar sua denúncia, tente novamente mais tarde.',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  }
                                else
                                  {
                                    Navigator.of(context).pop(),
                                    // Navigator.of(context)
                                    //     .pushNamedAndRemoveUntil(
                                    //         "/home", (route) => false),
                                  }
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

  void _updateSize(int size, bool isAdd) {
    if (isAdd) {
      setState(() {
        totalSize += size;
      });
    } else {
      setState(() {
        totalSize -= size;
      });
    }
  }

  Future<void> _selectPdf() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (file == null) {
      return;
    }

    setState(() {
      _pdfName.add(PDFModel(
        name: file.files.single.name,
        path: file.files.single.path!,
        size: file.files.single.size,
      ));
    });

    _updateSize(file.files.single.size, true);
  }

  Future<void> _selectImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);

    if (image == null) {
      return;
    }

    File file = File(image.path);
    int size = await file.length();

    setState(() {
      _imageFiles.add(ImageModel(
        image: file,
        size: size,
        path: file.path,
      ));
    });

    _updateSize(await file.length(), true);
  }

  Future<void> _deleteImage(String id) async {
    _showDialogConfirmation(
      title: 'Excluir imagem',
      message: 'Deseja realmente excluir a imagem?',
      onConfirm: () {
        setState(() {
          _updateSize(
              _imageFiles.firstWhere((element) => element.id == id).size,
              false);
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
          _updateSize(
              _pdfName.firstWhere((element) => element.id == id).size, false);
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

  void _showAlertLimitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Anexos muito grandes'),
          content: const Text(
              'Os anexos ultrapassaram 20MB. Remova alguns anexos para enviar o email.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _checkConnection() {
    if (ConnectivityResult.none == ConnectivityResult.none) {
      _showDialogConfirmation(
        title: 'Sem conexão',
        message: 'Você está sem conexão com a internet.',
        onConfirm: () {
          Navigator.of(context).pop();
        },
      );
      return false;
    }

    return true;
  }

  @override
  void initState() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showDialogConfirmation(
          title: 'Sem conexão',
          message: 'Você está sem conexão com a internet.',
          onConfirm: () {
            Navigator.of(context).pop();
          },
        );
      }
    });

    Connectivity().checkConnectivity().then((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Você está sem conexão com a internet.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    super.initState();
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
                      onPressed: _selectPdf,
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
                Text(
                  'Tamanho total dos arquivos: ${(totalSize / 1048576).toStringAsFixed(2)} MB / 20 MB',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _pdfName.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Arquivos PDF anexados:',
                            style: TextStyle(
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
                      if (totalSize > limitSize) {
                        _showAlertLimitDialog();
                        return;
                      }

                      List<String> fileToSend = [];
                      for (var element in _pdfName) {
                        fileToSend.add(element.path);
                      }
                      for (var element in _imageFiles) {
                        fileToSend.add(element.path);
                      }

                      context.read<ReportProvider>().message =
                          _messageController.text;
                      context.read<ReportProvider>().date =
                          _dateController.text;
                      context.read<ReportProvider>().setFiles(fileToSend);

                      if (!_checkConnection()) {
                        context.read<ReportProvider>().saveOnLocalStorage();
                        return;
                      }

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
