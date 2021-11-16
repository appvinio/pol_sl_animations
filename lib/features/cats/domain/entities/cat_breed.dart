import 'package:adoption_app/features/cats/domain/entities/cat_breed_image.dart';
import 'package:equatable/equatable.dart';

abstract class CatBreed extends Equatable {
  const CatBreed();

  String get id;

  String get name;

  String get description;

  String get temperament;

  String get lifeSpan;

  String? get altNames;

  String? get wikipediaUrl;

  String get origin;

  String get countryCode;

  CatBreedImage? get image;

  bool get isExperimental;

  bool get isHairless;

  bool get isNatural;

  bool get isIndoor;

  bool get isLap;

  bool get isRex;

  bool get hasSuppressTail;

  bool get hasShortLegs;

  bool get isHypoallergenic;

  int get adaptability;

  int get affectionLevel;

  int get childFriendly;

  int get dogFriendly;

  int get energyLevel;

  int get grooming;

  int get healthIssues;

  int get intelligence;

  int get sheddingLevel;

  int get socialNeeds;

  int get strangerFriendly;

  int get vocalisation;
}
