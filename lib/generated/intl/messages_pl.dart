// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  static String m0(value) => "${value} cm";

  static String m1(value) => "${value} kg";

  static String m2(years) =>
      "${Intl.plural(years, one: '1 Year', other: '${years} Years')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adaptability": MessageLookupByLibrary.simpleMessage("Adaptacja"),
        "adoption": MessageLookupByLibrary.simpleMessage("Adoption"),
        "centimeters": m0,
        "defaultError":
            MessageLookupByLibrary.simpleMessage("There was an error"),
        "details": MessageLookupByLibrary.simpleMessage("Details"),
        "detailsNo": MessageLookupByLibrary.simpleMessage("Nie"),
        "detailsYes": MessageLookupByLibrary.simpleMessage("Tak"),
        "dogFriendly":
            MessageLookupByLibrary.simpleMessage("Przyjazny dla psów"),
        "energyLevel": MessageLookupByLibrary.simpleMessage("Energia"),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "height": MessageLookupByLibrary.simpleMessage("Height: "),
        "intelligence": MessageLookupByLibrary.simpleMessage("Inteligencja"),
        "isHairless": MessageLookupByLibrary.simpleMessage("Bezwłosy"),
        "isHypoallergenic":
            MessageLookupByLibrary.simpleMessage("Hipoalergiczny"),
        "isIndoor": MessageLookupByLibrary.simpleMessage(
            "Przystosowany do życia w domu"),
        "isNatural": MessageLookupByLibrary.simpleMessage("Naturalny"),
        "kilograms": m1,
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "origin": MessageLookupByLibrary.simpleMessage("Origin: "),
        "pet": MessageLookupByLibrary.simpleMessage("Pet"),
        "recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
        "sheddingLevel": MessageLookupByLibrary.simpleMessage("Linienie"),
        "socialNeeds":
            MessageLookupByLibrary.simpleMessage("Wymagania socjalne"),
        "vocalisation": MessageLookupByLibrary.simpleMessage("Głośność"),
        "weight": MessageLookupByLibrary.simpleMessage("Weight: "),
        "yearsOld": m2
      };
}
