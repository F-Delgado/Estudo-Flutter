import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';


final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'http://192.168.100.15:8080/transactions';

