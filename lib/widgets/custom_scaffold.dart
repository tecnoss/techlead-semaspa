import 'package:flutter/material.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.appBarTitle,
    required this.child,
    required this.screenTitle,
  });
  final String appBarTitle;
  final List<Widget> child;
  final String screenTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar(title: appBarTitle),
        leading: const Leading(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ScreenTitle(title: screenTitle)],
        ),
      ),
    );
  }
}
