import 'package:get_it/get_it.dart';
import 'package:valoinfos/data/api_client.dart';
import 'package:valoinfos/repository/data_repository.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiClient>(ApiClient());
  locator.registerSingleton<DataRepository>(DataRepository.instance);
  locator.registerFactory(()=>DataViewModel());
}
