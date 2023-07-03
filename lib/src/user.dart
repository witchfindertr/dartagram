import 'dart:convert';

import 'package:http/http.dart' as http;

import 'biography.dart';
import 'post.dart';
import 'util/http_client.dart';

class User {
  late String id;
  late String fullName;
  late String username;
  late String profilePicUrl;
  late Biography biography;
  late List<dynamic> pronouns;
  late bool blockedByViewer;
  late dynamic restrictedByViewer; // Can be bool or null
  late bool countryBlock;
  late String externalUrl;
  late int followedBy;
  late int follow;
  late bool isPrivate;
  late bool isVerified;
  late List<Post> posts;
  late Map<String, dynamic> raw;

  static Future<User> fromUsername(String username) async {
    final httpPackageUrl = Uri.https('www.instagram.com',
        '/api/v1/users/web_profile_info/', {'username': username});
    final client = HttpClient(http.Client());
    final httpPackageResponse = await client.get(httpPackageUrl);

    if (httpPackageResponse.statusCode != 200) {
      throw Exception(
          'Failed to load user profile, ended with status code ${httpPackageResponse.statusCode}\n ${httpPackageResponse.body}');
    }

    if (httpPackageResponse.headers['content-type'] != 'application/json') {
      throw Exception(
          'Failed to load user profile, content type is not application/json, probably due to a rate limit');
    }

    Map<String, dynamic> data =
        jsonDecode(httpPackageResponse.body)['data']['user'];

    return User.fromData(data);
  }

  static fromData(Map<String, dynamic> data) {
    User user = User();

    user.id = data['id'];
    user.fullName = data['full_name'];
    user.username = data['username'];
    user.profilePicUrl = data['profile_pic_url'];
    user.biography = Biography.fromData(data);
    user.pronouns = data['pronouns'];
    user.blockedByViewer = data['blocked_by_viewer'];
    user.restrictedByViewer = data['restricted_by_viewer'];
    user.countryBlock = data['country_block'];
    user.externalUrl = data['external_url'];
    user.followedBy = data['edge_followed_by']['count'];
    user.follow = data['edge_follow']['count'];
    user.isPrivate = data['is_private'];
    user.isVerified = data['is_verified'];

    user.posts = [];
    for (var post in data['edge_owner_to_timeline_media']['edges']) {
      user.posts.add(Post.fromData(post['node']));
    }

    user.raw = data;

    return user;
  }
}
