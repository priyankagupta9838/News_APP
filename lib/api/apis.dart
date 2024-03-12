
import 'package:http/http.dart' as http;


class AllApis{

  String baseUrl="http://3.110.177.226:8000";

  Stream<http.Response>articles() {

    return   http.get(Uri.parse("$baseUrl/articles")).asStream();
  }

  Stream<http.Response> categories()  {

    return  http.get(Uri.parse("$baseUrl/categories")).asStream();
  }



}