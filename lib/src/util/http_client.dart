import 'package:http/http.dart' as http;
import 'package:faker/faker.dart';

class HttpClient extends http.BaseClient {
  final http.Client _client;

  HttpClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final faker = Faker();

    final versions = [
      '289.0.0.25.49',
      '278.0.0.22.117',
      '277.0.0.17.107',
      '269.0.0.18.75',
      '268.0.0.14.75',
      '265.0.0.19.301'
    ];

    var userAgent =
        '${faker.internet.userAgent()} Mobile/15E148 Instagram ${versions[faker.randomGenerator.integer(versions.length - 1)]}';

    request.headers['User-Agent'] = userAgent;
    request.headers['Origin'] = 'https://www.instagram.com';
    request.headers['Referer'] = 'https://www.instagram.com/';

    return _client.send(request);
  }
}
