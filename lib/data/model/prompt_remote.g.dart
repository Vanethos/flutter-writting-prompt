// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_remote.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<PromptRemote> _$promptRemoteSerializer =
    new _$PromptRemoteSerializer();

class _$PromptRemoteSerializer implements StructuredSerializer<PromptRemote> {
  @override
  final Iterable<Type> types = const [PromptRemote, _$PromptRemote];
  @override
  final String wireName = 'PromptRemote';

  @override
  Iterable serialize(Serializers serializers, PromptRemote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'english',
      serializers.serialize(object.english,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PromptRemote deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromptRemoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'english':
          result.english = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PromptRemote extends PromptRemote {
  @override
  final String english;
  @override
  final int count;

  factory _$PromptRemote([void updates(PromptRemoteBuilder b)]) =>
      (new PromptRemoteBuilder()..update(updates)).build();

  _$PromptRemote._({this.english, this.count}) : super._() {
    if (english == null) {
      throw new BuiltValueNullFieldError('PromptRemote', 'english');
    }
    if (count == null) {
      throw new BuiltValueNullFieldError('PromptRemote', 'count');
    }
  }

  @override
  PromptRemote rebuild(void updates(PromptRemoteBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PromptRemoteBuilder toBuilder() => new PromptRemoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromptRemote &&
        english == other.english &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, english.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PromptRemote')
          ..add('english', english)
          ..add('count', count))
        .toString();
  }
}

class PromptRemoteBuilder
    implements Builder<PromptRemote, PromptRemoteBuilder> {
  _$PromptRemote _$v;

  String _english;
  String get english => _$this._english;
  set english(String english) => _$this._english = english;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  PromptRemoteBuilder();

  PromptRemoteBuilder get _$this {
    if (_$v != null) {
      _english = _$v.english;
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromptRemote other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PromptRemote;
  }

  @override
  void update(void updates(PromptRemoteBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PromptRemote build() {
    final _$result =
        _$v ?? new _$PromptRemote._(english: english, count: count);
    replace(_$result);
    return _$result;
  }
}
