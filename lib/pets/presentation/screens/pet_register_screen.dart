import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petto/core/files/application/app_file_view_model.dart';
import 'package:petto/core/files/application/files_notifier.dart';
import 'package:petto/core/form/application/touched_provider.dart';
import 'package:petto/pets/presentation/widgets/pet_register_form.dart';
import 'package:petto/pets/shared/constant.dart';
import 'package:petto/pets/shared/providers.dart';

class PetRegisterScreen extends StatefulHookConsumerWidget {
  const PetRegisterScreen({
    super.key,
    required this.id,
    this.files = const [],
  });

  final String id;
  final List<AppFileViewModel> files;

  @override
  ConsumerState<PetRegisterScreen> createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends ConsumerState<PetRegisterScreen> {
  /// Folder for files (nested in document).
  String filesFolder = 'files';

  /// Getter for "form" and "files" family.
  String get family => petsModule;

  /// Returns true if there are pending files to be uploaded or deleted.
  bool get hasFilePending => ref.read(filesNotifierProvider(family).notifier).hasFilesPending;

  /// Collection path for user documents.
  String get collectionPath => ref.read(petCollectionPathProvider);

  /// Builds the storage path for files.
  String? get storagePath => _buildStoragePath(widget.id);

  /// Builds the Firestore path for files.
  String? get firestorePath => _buildFirestorePath(widget.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: PetRegisterForm(
        id: widget.id,
        setTouchedState: (touched) {
          _setTouchedState(touched || hasFilePending);
        },
        beforeSave: (entity) async {
          // Prevent breaking file list
          ref.read(filesNotifierProvider(family).notifier).processFiles(hold: true);
        },
      ),
    );
  }

  void _setTouchedState(bool touched) {
    if (touched) {
      ref.read(touchedProvider(petsModule).notifier).touched();
    } else {
      ref.read(touchedProvider(petsModule).notifier).untouched();
    }
  }

  String _buildStoragePath(String? id) {
    return '$collectionPath/$id/$filesFolder';
  }

  String _buildFirestorePath(String? id) {
    return '$collectionPath/$id/$filesFolder';
  }
}
