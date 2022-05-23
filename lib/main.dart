import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_manga/repository.dart';
import 'package:mad_manga/simple_bloc_observer.dart';
import 'package:mad_manga/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(App(repository: Repository())),
    blocObserver: SimpleBlocObserver(),
  );
}
