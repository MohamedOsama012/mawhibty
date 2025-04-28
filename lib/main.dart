import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/controller/cubit/app/app_cubit.dart';
import 'package:mawhibty/controller/cubit/bloc_observer.dart';
import 'package:mawhibty/controller/cubit/forget_password/forget_password_cubit.dart';
import 'package:mawhibty/controller/cubit/register/register_cubit.dart';
import 'package:mawhibty/generated/l10n.dart';
import 'package:mawhibty/organization/views/screens/organization_layout.dart';
import 'package:mawhibty/start/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'موهبتي',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.cairoTextTheme().apply(
            bodyColor: primaryTextColor,
            displayColor: primaryTextColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: GoogleFonts.cairo(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          useMaterial3: true,
        ),
        home: const OrganizationLayout(),
      ),
    );
  }
}
