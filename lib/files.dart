import 'dart:io' show Platform;

import 'package:path/path.dart';

const List<String> videoFormats = [
  '.mp4',
  '.mov',
  '.avi',
  '.wmv',
  '.3gp',
  '.mkv',
  '.flv',
  '.webm'
];
const List<String> imageFormats = [
  '.jpeg',
  '.png',
  '.jpg',
  '.gif',
  '.webp',
  '.tif',
  '.heic'
];
const http = 'http';

bool isLocalFilePath(String path) {
  Uri uri = Uri.parse(path);
  return !uri.scheme.contains(http);
}

bool isVideo(String path) {
    // force check for iOS and WebM video, and return false if it is
    // since iOS doesn't support WebM video within its gallery
    if (Platform.isIOS && extension(path).toLowerCase() == '.webm') {
      return false;
    }

    return videoFormats.contains(extension(path).toLowerCase());
}

bool isImage(String path) =>
    imageFormats.contains(extension(path).toLowerCase());
