import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:semasma/screens/app_splash_screen.dart';
import 'package:semasma/screens/denuncia_ouvidoria/repository/subject_repository.dart';
import 'package:semasma/utils/app_theme.dart';

import 'screens/chamado_catis/catis_form.dart';
import 'screens/chamado_catis/chamado_catis_screen.dart';
import 'screens/chamado_catis/details_catis_form.dart';
import 'screens/denuncia_ouvidoria/data_location_screen.dart';
import 'screens/denuncia_ouvidoria/denuncia_ouvidoria_screen.dart';
import 'screens/denuncia_ouvidoria/identification_screen.dart';
import 'screens/denuncia_ouvidoria/location_denuncia.dart';
import 'screens/denuncia_ouvidoria/select_denuncia_screen.dart';
import 'screens/faqs/faqs_screen.dart';
import 'screens/home_screen.dart';
import 'screens/links_uteis/links_uteis_screen.dart';
import 'screens/portal_transparencia/portal_transparencia_screen.dart';
import 'screens/previsao_tempo/previsao_tempo.dart';
import 'screens/redes_sociais/redes_sociais_screen.dart';
import 'screens/simlam/processo_simlam_screen.dart';
import 'utils/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool darkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SubjectRepository>(
          create: (_) => SubjectRepository(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
        theme: AppThemeData.lightTheme,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const AppSplashScreen(),
              );
            case '/home':
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
            case '/previsao_tempo':
              return MaterialPageRoute(
                builder: (context) => const PrevisaoTempo(),
              );
            case '/redes_sociais':
              return MaterialPageRoute(
                builder: (context) => RedesSociaisScreen(),
              );
            case '/processo_simlam':
              return MaterialPageRoute(
                builder: (context) => const ProcessoSimlamScreen(),
              );
            case '/portal_transparencia':
              return MaterialPageRoute(
                builder: (context) => const PortalTransparenciaScreen(),
              );
            case '/links_uteis':
              return MaterialPageRoute(
                builder: (context) => const LinksUteisScreen(),
              );
            case '/denuncia_ouvidoria':
              return MaterialPageRoute(
                builder: (context) => const DenunciaOuvidoriaScreen(),
              );
            case '/denuncia_ouvidoria/select_denuncia':
              var args = settings.arguments as SelectDenunciaScreenArguments;
              return MaterialPageRoute(
                builder: (context) => SelectDenunciaScreen(
                  titleScreen: args.titleScreen,
                  listOptions: args.listOptions,
                ),
              );
            case '/denuncia_ouvidoria/identification':
              return MaterialPageRoute(
                builder: (context) => const IdentificationScreen(),
              );
            case '/denuncia_ouvidoria/location':
              return MaterialPageRoute(
                builder: (context) => const LocationDenunciaScreen(),
              );
            case '/denuncia_ouvidoria/data_location':
              return MaterialPageRoute(
                builder: (context) => const DataLocationScreen(),
              );
            case '/chamado_catis':
              return MaterialPageRoute(
                builder: (context) => const ChamadoCatisSCreen(),
              );
            case '/chamado_catis/form':
              return MaterialPageRoute(
                builder: (context) => const CatisFormScreen(),
              );
            case '/chamado_catis/details':
              return MaterialPageRoute(
                builder: (context) => const DetailCatisForm(),
              );
            case '/faqs':
              return MaterialPageRoute(
                builder: (context) => const FaqsScreen(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
          }
        },
      ),
    );
  }
}
