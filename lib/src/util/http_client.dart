import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  final http.Client _client;

  HttpClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['User-Agent'] =
        'Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 289.0.0.25.49 (iPhone11,8; iOS 12_3_1; en_US; en-US; scale=2.00; 828x1792; 165586599)';
    request.headers['Origin'] = 'https://www.instagram.com';
    request.headers['Referer'] = 'https://www.instagram.com/';

    return _client.send(request);
  }
}
