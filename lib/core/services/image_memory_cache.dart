import 'dart:typed_data';

class ImageMemoryCache {
  ImageMemoryCache._();
  static final ImageMemoryCache instance = ImageMemoryCache._();

  final _cache = <String, Uint8List>{};

  Uint8List? get(String url) => _cache[url];

  void set(String url, Uint8List bytes) => _cache[url] = bytes;

  bool has(String url) => _cache.containsKey(url);

  void remove(String url) => _cache.remove(url);

  void clear() => _cache.clear();
}
