import 'package:gallery/data/responses/auth_response/auth_responses.dart';

const ID_CACHE_KEY="ID_CACHE_KEY";
abstract class LocalDataSource {
  Future<AllDataResponse> getJoIDCache();
  Future<void> saveIDtoCache (AllDataResponse jobIDResponse);
}
class LocalDataSourceImp extends LocalDataSource{
  Map<String,CachedItem> cachedMap = Map();
  @override
  Future<AllDataResponse> getJoIDCache() {
    // TODO: implement joID
    throw UnimplementedError();
  }

  @override
  Future<void> saveIDtoCache(AllDataResponse jobIDResponse) async {
    cachedMap[ID_CACHE_KEY] =CachedItem(jobIDResponse);
  }

}
class CachedItem{
  dynamic data;
  int cacheTime = DateTime.now().microsecondsSinceEpoch;
  CachedItem(this.data);
}