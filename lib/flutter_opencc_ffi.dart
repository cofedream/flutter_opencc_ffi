import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';

import 'package:flutter_opencc_ffi/src/opencc.g.dart';
import 'package:path/path.dart' as path;

class FlutterOpenccFfi {
  final String dataDir;
  final String type;
  late final Pointer<Char> _typePtr;
  static final Bindings bindings = Bindings(_getDynamicLibrary());

  /// [type]
  /// [dataDir] is the directory contains `.json` and `.ocd2` files.
  FlutterOpenccFfi(this.type, this.dataDir) {
    if (!Directory(dataDir).existsSync()) {
      throw AssertionError('dataDir[$dataDir] not exists');
    }
    _typePtr = type.toNativeUtf8().cast();
    Pointer<Utf8> configFilePtr = _getConfigFileFromType(type).toNativeUtf8();
    bindings.opencc_init_converter(_typePtr, configFilePtr.cast());
    malloc.free(configFilePtr);
  }

  static DynamicLibrary _getDynamicLibrary() {
    if (Platform.isAndroid) {
      try {
        return DynamicLibrary.open('libopencc.so');
        // ignore: avoid_catching_errors
      } on ArgumentError {
        // On some (especially old) Android devices, we somehow can't dlopen
        // libraries shipped with the apk. We need to find the full path of the
        // library (/data/data/<id>/lib/libopencc.so) and open that one.
        // For details, see https://github.com/simolus3/moor/issues/420
        final appIdAsBytes = File('/proc/self/cmdline').readAsBytesSync();

        // app id ends with the first \0 character in here.
        final endOfAppId = math.max(appIdAsBytes.indexOf(0), 0);
        final appId = String.fromCharCodes(appIdAsBytes.sublist(0, endOfAppId));

        return DynamicLibrary.open('/data/data/$appId/lib/libopencc.so');
      }
    } else if (Platform.isLinux) {
      return DynamicLibrary.open('libopencc.so');
    } else if (Platform.isIOS || Platform.isMacOS) {
      return DynamicLibrary.process();
    } else if (Platform.isWindows) {
      return DynamicLibrary.open('opencc.dll');
    }

    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  String _getConfigFileFromType(String type) => path.join(dataDir, '$type.json');

  String convert(String text) {
    if (text.isEmpty) {
      return text;
    }
    Pointer<Utf8> textPtr = text.toNativeUtf8();
    Pointer<Char> resultPtr = bindings.opencc_convert(textPtr.cast(), _typePtr);
    malloc.free(textPtr);
    String result = resultPtr.cast<Utf8>().toDartString();
    bindings.opencc_free_string(resultPtr);
    return result;
  }

  List<String> convertList(List<String> texts) {
    if (texts.isEmpty) {
      return texts;
    }
    int size = texts.length;
    Iterable<Pointer<Utf8>> textPtrList = texts.map((e) => e.toNativeUtf8());
    Pointer<Pointer<Utf8>> textsPtr = malloc<Pointer<Utf8>>(size);
    int i = 0;
    for (Pointer<Utf8> textPtr in textPtrList) {
      textsPtr[i++] = textPtr;
    }
    Pointer<Pointer<Char>> resultPtr = bindings.opencc_convert_list(textsPtr.cast(), size, _typePtr);
    textPtrList.forEach(malloc.free);
    malloc.free(textsPtr);
    List<String> result = List.generate(size, (index) => resultPtr[index].cast<Utf8>().toDartString());
    bindings.opencc_free_string_array(resultPtr, size);
    return result;
  }

  void dispose() {
    malloc.free(_typePtr);
  }
}