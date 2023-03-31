import 'package:get_it/get_it.dart';
import 'package:paperless_app/features/gallery/data/datasources/image_remote_datasource_impl.dart';
import 'package:paperless_app/features/gallery/domain/usecases/get_images.dart';
import 'package:paperless_app/features/kyc/domain/usecases/upload_usecase.dart';

import '../features/gallery/data/datasources/image_remote_datasource.dart';
import '../features/gallery/data/repositories/network_image_repository_impl.dart';
import '../features/gallery/domain/repositories/network_image_repository.dart';
import '../features/kyc/data/datasources/upload_data.dart';
import '../features/kyc/data/datasources/upload_datasource_impl.dart';
import '../features/kyc/data/repositories/upload_repositpry_impl.dart';
import '../features/kyc/domain/repositories/upload_repository.dart';

final sl = GetIt.instance;

void initUploadFeature() {
  initKYCFeature();
  initGalleryFeature();
}

void initKYCFeature() {
  sl.registerLazySingleton(() => UploadKYC(repository: sl()));

  sl.registerLazySingleton<UploadRepository>(() => UploadRepositoryImpl(
        dataSource: sl(),
      ));

  sl.registerLazySingleton<UploadDataSource>(() => UploadDataSourceImpl());
}

void initGalleryFeature() {
  sl.registerLazySingleton(() => GetImages(repository: sl()));

  sl.registerLazySingleton<NetworkImageRepository>(
      () => NetworkImageRepositoryImpl(
            dataSource: sl(),
          ));

  sl.registerLazySingleton<ImgRemoteDatasource>(
      () => ImgRemoteDataSourceImpl());
}
