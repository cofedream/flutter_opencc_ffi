// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Auto-generated, internal bindings to opencc
class Bindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  Bindings(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  Bindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void opencc_init_converter(
    ffi.Pointer<ffi.Char> type,
    ffi.Pointer<ffi.Char> configFile,
  ) {
    return _opencc_init_converter(
      type,
      configFile,
    );
  }

  late final _opencc_init_converterPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>)>>('opencc_init_converter');
  late final _opencc_init_converter = _opencc_init_converterPtr.asFunction<
      void Function(ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>)>();

  ffi.Pointer<ffi.Char> opencc_convert(
    ffi.Pointer<ffi.Char> text,
    ffi.Pointer<ffi.Char> type,
  ) {
    return _opencc_convert(
      text,
      type,
    );
  }

  late final _opencc_convertPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>)>>('opencc_convert');
  late final _opencc_convert = _opencc_convertPtr.asFunction<
      ffi.Pointer<ffi.Char> Function(
          ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>)>();

  ffi.Pointer<ffi.Pointer<ffi.Char>> opencc_convert_list(
    ffi.Pointer<ffi.Pointer<ffi.Char>> list,
    int size,
    ffi.Pointer<ffi.Char> type,
  ) {
    return _opencc_convert_list(
      list,
      size,
      type,
    );
  }

  late final _opencc_convert_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Pointer<ffi.Char>> Function(
              ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Int,
              ffi.Pointer<ffi.Char>)>>('opencc_convert_list');
  late final _opencc_convert_list = _opencc_convert_listPtr.asFunction<
      ffi.Pointer<ffi.Pointer<ffi.Char>> Function(
          ffi.Pointer<ffi.Pointer<ffi.Char>>, int, ffi.Pointer<ffi.Char>)>();

  void opencc_free_string(
    ffi.Pointer<ffi.Char> str,
  ) {
    return _opencc_free_string(
      str,
    );
  }

  late final _opencc_free_stringPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Char>)>>(
          'opencc_free_string');
  late final _opencc_free_string =
      _opencc_free_stringPtr.asFunction<void Function(ffi.Pointer<ffi.Char>)>();

  void opencc_free_string_array(
    ffi.Pointer<ffi.Pointer<ffi.Char>> array,
    int size,
  ) {
    return _opencc_free_string_array(
      array,
      size,
    );
  }

  late final _opencc_free_string_arrayPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Int)>>('opencc_free_string_array');
  late final _opencc_free_string_array = _opencc_free_string_arrayPtr
      .asFunction<void Function(ffi.Pointer<ffi.Pointer<ffi.Char>>, int)>();

  int opencc_dummy_method_to_enforce_bundling() {
    return _opencc_dummy_method_to_enforce_bundling();
  }

  late final _opencc_dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function()>>(
          'opencc_dummy_method_to_enforce_bundling');
  late final _opencc_dummy_method_to_enforce_bundling =
      _opencc_dummy_method_to_enforce_bundlingPtr.asFunction<int Function()>();
}