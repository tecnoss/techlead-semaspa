import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/subject_provider.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../models/subject_model.dart';

class SelectDenunciaScreenArguments {
  final String titleScreen;

  SelectDenunciaScreenArguments({
    required this.titleScreen,
  });
}

class SelectDenunciaScreen extends StatefulWidget {
  const SelectDenunciaScreen({
    super.key,
    required this.titleScreen,
  });
  final String titleScreen;

  @override
  State<SelectDenunciaScreen> createState() => _SelectDenunciaScreenState();
}

class _SelectDenunciaScreenState extends State<SelectDenunciaScreen> {
  final List<Subject> _searchList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Subject> subjectList = context
        .read<SubjectRepository>()
        .getSubjectsByScope(widget.titleScreen);

    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ScreenTitle(title: widget.titleScreen),
              const Text(
                'Faça sua pesquisa ou selecione o tipo de denúncia',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.height,
              TextField(
                controller: _searchController,
                style: const TextStyle(fontSize: 12.0),
                onChanged: (value) => setState(() {
                  _searchList.clear();
                  if (value.isNotEmpty) {
                    for (Subject sub in subjectList) {
                      if (sub.name
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        _searchList.add(sub);
                      }
                    }
                  }
                }),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 0.0),
                  ),
                  labelText: 'Denúncia',
                  labelStyle: const TextStyle(fontSize: 12.0),
                  hintText: 'Digite o tipo de denúncia',
                  hintStyle: const TextStyle(fontSize: 12.0),
                  isDense: true,
                  suffixIcon: Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: appColorPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
              16.height,
              _searchController.text.isNotEmpty && _searchList.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum resultado encontrado',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _searchList.isNotEmpty
                          ? _searchList.length
                          : subjectList.length,
                      itemBuilder: (context, index) {
                        Subject option = _searchList.isNotEmpty
                            ? _searchList[index]
                            : subjectList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<SubjectRepository>()
                                  .selectedSubject = option;
                              Navigator.pushNamed(
                                  context, '/denuncia_ouvidoria/city');
                            },
                            child: ListTile(
                              title: Text(
                                option.name,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
