import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:training_flutter_ui/bloc/l10n_cubit.dart';
import 'package:training_flutter_ui/bloc/l10n_state.dart';
import 'package:training_flutter_ui/network/base_client.dart';
import 'package:training_flutter_ui/network/movie_network.dart';
import 'package:training_flutter_ui/repositories/movie_repository.dart';
import 'package:training_flutter_ui/router/route_config.dart';
import 'package:training_flutter_ui/router/route_source.dart';
import 'package:training_flutter_ui/ui/screen/main_screen/main_screen.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  await Get.putAsync(() => MovieNetwork().init(BaseClient.instance.client!));
  await Get.putAsync(() => MovieRepository().init());

  // Get.put<HomeController>(HomeController());
  // Get.put(DetailController());
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return L10nCubit();
      },
      child: BlocBuilder<L10nCubit, L10nState>(
        builder: (context, state) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: Locale(state.currentLanguage),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: RouterSource.main,
            getPages: RouteConfig.getPages,
            home: MainScreen(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
