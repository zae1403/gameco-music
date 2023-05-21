import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/music/params/filter_music_params.dart';
import '../../core/exceptions.dart';
import '../models/song_model.dart';

abstract class IMusicRemoteDataSource {
  Future<List<SongModel>> getSongs(FilterMusicParams params);
}

class MusicRemoteDataSourceImpl extends IMusicRemoteDataSource {
  final Dio _client;

  MusicRemoteDataSourceImpl(this._client);
  @override
  Future<List<SongModel>> getSongs(FilterMusicParams params) async {
    try {
      final response = await _client.get(
        '/search',
        queryParameters: params.toJson(),
      );
      final json = jsonDecode(response.data);
      final List data = json['results'];
      return data.map((e) => SongModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw ServerException.withError(e);
    }
  }
}
