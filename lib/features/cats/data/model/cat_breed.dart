import 'package:adoption_app/features/cats/data/model/cat_breed_image.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_breed.g.dart';

@JsonSerializable()
class CatBreedModel extends CatBreed {
  const CatBreedModel({
    required this.adaptability,
    required this.affectionLevel,
    required this.altNames,
    required this.childFriendly,
    required this.countryCode,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.hasShortLegs,
    required this.hasSuppressTail,
    required this.healthIssues,
    required this.intelligence,
    required this.isExperimental,
    required this.isHairless,
    required this.isHypoallergenic,
    required this.isNatural,
    required this.isRex,
    required this.lifeSpan,
    required this.origin,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.temperament,
    required this.vocalisation,
    required this.wikipediaUrl,
    required this.id,
    required this.name,
    required this.isLap,
    required this.isIndoor,
    required this.description,
    required this.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) =>
      _$CatBreedModelFromJson(json);

  @override
  final String id;

  @override
  final String name;

  @override
  final int adaptability;

  @override
  @JsonKey(name: 'affection_level')
  final int affectionLevel;

  @override
  @JsonKey(name: 'alt_names')
  final String? altNames;

  @override
  @JsonKey(name: 'child_friendly')
  final int childFriendly;

  @override
  @JsonKey(name: 'country_code')
  final String countryCode;

  @override
  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;

  @override
  @JsonKey(name: 'energy_level')
  final int energyLevel;

  @override
  final int grooming;

  @override
  @JsonKey(name: 'short_legs', fromJson: integerToBoolean)
  final bool hasShortLegs;

  @override
  @JsonKey(name: 'suppress_tail', fromJson: integerToBoolean)
  final bool hasSuppressTail;

  @override
  @JsonKey(name: 'health_issues')
  final int healthIssues;

  @override
  final int intelligence;

  @override
  @JsonKey(name: 'experimental', fromJson: integerToBoolean)
  final bool isExperimental;

  @override
  @JsonKey(name: 'hairless', fromJson: integerToBoolean)
  final bool isHairless;

  @override
  @JsonKey(name: 'hypoallergenic', fromJson: integerToBoolean)
  final bool isHypoallergenic;

  @override
  @JsonKey(name: 'natural', fromJson: integerToBoolean)
  final bool isNatural;

  @override
  @JsonKey(name: 'rex', fromJson: integerToBoolean)
  final bool isRex;

  @override
  @JsonKey(name: 'life_span')
  final String lifeSpan;

  @override
  final String origin;

  @override
  @JsonKey(name: 'shedding_level')
  final int sheddingLevel;

  @override
  @JsonKey(name: 'social_needs')
  final int socialNeeds;

  @override
  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;

  @override
  final String temperament;

  @override
  final int vocalisation;

  @override
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  @override
  final String description;

  @override
  final CatBreedImageModel? image;

  @override
  @JsonKey(name: 'indoor', fromJson: integerToBoolean)
  final bool isIndoor;

  @override
  @JsonKey(name: 'lap', fromJson: integerToBoolean)
  final bool isLap;

  @override
  List<Object?> get props => [
        adaptability,
        affectionLevel,
        altNames,
        childFriendly,
        countryCode,
        dogFriendly,
        energyLevel,
        grooming,
        hasShortLegs,
        hasSuppressTail,
        healthIssues,
        intelligence,
        isExperimental,
        isHairless,
        isHypoallergenic,
        isNatural,
        isRex,
        lifeSpan,
        origin,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        temperament,
        vocalisation,
        wikipediaUrl,
        id,
        name,
      ];
}

bool integerToBoolean(int? value) => value == 1;
