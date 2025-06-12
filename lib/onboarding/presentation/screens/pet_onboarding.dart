import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PetOnboardingScreen extends StatefulWidget {
  const PetOnboardingScreen({super.key});

  @override
  State<PetOnboardingScreen> createState() => _PetOnboardingScreenState();
}

class _PetOnboardingScreenState extends State<PetOnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const _pages = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    final total = _pages.length;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('registerPet'.tr()),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_currentPage + 1} de $total'),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_currentPage + 1) / total,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: PageView.builder(
              controller: _controller,
              itemCount: total,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (context, index) {
                return Container(
                  color: _pages[index],
                  child: Center(
                    child: Text(
                      'Paso ${index + 1}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
