import 'package:easy_localization/easy_localization.dart';
import 'package:petto/pets/domain/pet_specie.dart';

/// Represents the most popular pet breeds per species.
enum PetBreed {
  // 🐶 Dog breeds
  labradorRetriever(specie: PetSpecie.dog),
  germanShepherd(specie: PetSpecie.dog),
  goldenRetriever(specie: PetSpecie.dog),
  bulldog(specie: PetSpecie.dog),
  poodle(specie: PetSpecie.dog),
  beagle(specie: PetSpecie.dog),
  rottweiler(specie: PetSpecie.dog),
  dachshund(specie: PetSpecie.dog),
  yorkshireTerrier(specie: PetSpecie.dog),
  boxer(specie: PetSpecie.dog),

  // 🐱 Cat breeds
  persian(specie: PetSpecie.cat),
  maineCoon(specie: PetSpecie.cat),
  siamese(specie: PetSpecie.cat),
  bengal(specie: PetSpecie.cat),
  britishShorthair(specie: PetSpecie.cat),
  sphynx(specie: PetSpecie.cat),
  ragdoll(specie: PetSpecie.cat),
  americanShorthair(specie: PetSpecie.cat),
  scottishFold(specie: PetSpecie.cat),
  russianBlue(specie: PetSpecie.cat),

  // 🐰 Rabbit breeds
  hollandLop(specie: PetSpecie.rabbit),
  miniRex(specie: PetSpecie.rabbit),
  lionhead(specie: PetSpecie.rabbit),
  netherlandDwarf(specie: PetSpecie.rabbit),
  miniLop(specie: PetSpecie.rabbit),
  flemishGiant(specie: PetSpecie.rabbit),
  englishAngora(specie: PetSpecie.rabbit),
  rex(specie: PetSpecie.rabbit),
  polish(specie: PetSpecie.rabbit),
  harlequin(specie: PetSpecie.rabbit),

  // 🐦 Bird breeds
  budgerigar(specie: PetSpecie.bird),
  cockatiel(specie: PetSpecie.bird),
  canary(specie: PetSpecie.bird),
  lovebird(specie: PetSpecie.bird),
  africanGrey(specie: PetSpecie.bird),
  parakeet(specie: PetSpecie.bird),
  conure(specie: PetSpecie.bird),
  finch(specie: PetSpecie.bird),
  amazonParrot(specie: PetSpecie.bird),
  cockatoo(specie: PetSpecie.bird),

  // 🐠 Fish breeds
  betta(specie: PetSpecie.fish),
  goldfish(specie: PetSpecie.fish),
  guppy(specie: PetSpecie.fish),
  angelfish(specie: PetSpecie.fish),
  molly(specie: PetSpecie.fish),
  platy(specie: PetSpecie.fish),
  neonTetra(specie: PetSpecie.fish),
  swordtail(specie: PetSpecie.fish),
  cichlid(specie: PetSpecie.fish),
  zebraDanio(specie: PetSpecie.fish),

  // 🐾 Other breeds
  other(specie: PetSpecie.other);

  final PetSpecie specie;

  const PetBreed({required this.specie});

  /// Localized breed name for UI display.
  String get displayName => name.tr();
}
