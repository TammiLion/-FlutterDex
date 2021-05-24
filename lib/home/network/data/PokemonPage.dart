import 'package:flutter/foundation.dart';
import 'package:flutterdex/common/data/PokeApiPage.dart';
import 'package:flutterdex/home/network/PokemonPageNetworkDataSource.dart';
import 'package:flutterdex/home/util/PokeApiPageMapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PokemonPage.freezed.dart';

@freezed
class PokemonPage with _$PokemonPage {
  const PokemonPage._();

  factory PokemonPage(
      {@Default(null) int? count,
      @Default(0) int? next,
        @Default(0) int? previous,
      @Default([]) List<String> results}) = _PokemonPage;

  //Returns a new PokemonPage object with the given results inserted after
  PokemonPage insertAfter(PokeApiPage page) {
    return this.copyWith(
        count: page.count,
        next: calculateNextValue(),
        results: results + page.mapToList());
  }

  //Returns a new PokemonPage object with the given results inserted before
  PokemonPage insertBefore(PokeApiPage page) {
    return this.copyWith(
        count: page.count,
        previous: calculatePreviousValue(),
        results: page.mapToList() + results);
  }

  int? calculateNextValue() {
    final current = next;
    if (current == null || (count != null && current >= count!)) {
      return null;
    } else {
      return current + defaultLimit;
    }
  }

  int? calculatePreviousValue() {
    final current = previous;
    if (current == null || current <= 0) {
      return null;
    } else {
      return current - defaultLimit;
    }
  }

  PokemonPage update(PokeApiPage page) {
    if (page.offset == next) {
      return insertAfter(page);
    }
    if (page.offset == previous) {
      return insertBefore(page);
    }
    return this;
  }
}
