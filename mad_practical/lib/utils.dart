import 'package:get_it/get_it.dart';
import 'package:mad_practical/services/apiService.dart';
import 'package:mad_practical/services/navigationService.dart';

Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;

  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );

  getIt.registerSingleton<ApiService>(ApiService());
}
