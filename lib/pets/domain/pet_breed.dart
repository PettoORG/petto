import 'package:easy_localization/easy_localization.dart';
import 'package:petto/pets/domain/pet_specie.dart';

/// Common prefix for every avatar stored in Firebase.
const String _kFirebaseAvatarBaseUrl =
    'https://firebasestorage.googleapis.com/v0/b/petto-85bfc.firebasestorage.app/o/pet-avatars%2F';

/// Represents the most popular pet breeds per species (America 2025).
enum PetBreed {
  // 🐶 Dog breeds
  mixedDog(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  labradorRetriever(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FlabradorRetriever.png?alt=media&token=a330df96-fa88-4202-8035-368f779a6264',
  ),
  frenchBulldog(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FfrenchBulldog.png?alt=media&token=a30bf064-c090-41f8-b940-694d1d0d6179',
  ),
  chihuahua(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2Fchihuahua.png?alt=media&token=5d90368a-a69d-4080-b5aa-71bfba8d9d67',
  ),
  goldenRetriever(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  shihTzu(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  poodle(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  germanShepherd(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  dachshund(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  rottweiler(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  beagle(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  yorkshireTerrier(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  pomeranian(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  boxer(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  pitBull(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),
  otherDog(
    specie: PetSpecie.dog,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}dogs%2FmixedDog.png?alt=media&token=49c23358-6626-4a51-a45c-088914eb21b2',
  ),

  // 🐱 Cat breeds
  mixedCat(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  maineCoon(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmaineCoon.png?alt=media&token=08c7600a-a2cd-4d9b-bee0-52c2fc20b2ff',
  ),
  ragdoll(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2Fragdoll.png?alt=media&token=cd745e56-073b-4e1a-bbdf-c22bc7805aa6',
  ),
  siamese(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2Fsiamese.png?alt=media&token=2e3fe168-01c4-42a0-b587-c5b84dff9518',
  ),
  persian(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  bengal(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  sphynx(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  britishShorthair(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  scottishFold(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  americanShorthair(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  siberian(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  exoticShorthair(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  russianBlue(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  norwegianForest(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  devonRex(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),
  otherCat(
    specie: PetSpecie.cat,
    defaultImageUrl:
        '${_kFirebaseAvatarBaseUrl}cats%2FmixedCat.png?alt=media&token=40ae7366-ccdb-4ce2-a9a7-d0b4b4ab9f14',
  ),

  // 🐾 Other species
  other(
    specie: PetSpecie.other,
    defaultImageUrl: 'https://example.com/images/pets/breeds/other.png',
  );

  final PetSpecie specie;
  final String defaultImageUrl;

  const PetBreed({
    required this.specie,
    required this.defaultImageUrl,
  });

  /// Localized breed name for UI display.
  String get displayName => 'petBreedEnum.$name'.tr();
}
