import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {

  
  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
        
    return Response(
      // data:{"name": "Apple", "price": "2000"} ,
      statusCode: 200,
      requestOptions: RequestOptions(),
    );
  }
}
