import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/app_item.dart';
import '../widgets/app_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AppItem> apps = [];
  bool isLoading = true;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    loadAppsFromFirebase();
  }

  Future<void> loadAppsFromFirebase() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Simular carregamento do Firebase Storage
      // Em uma implementação real, você carregaria os dados do Firebase
      await Future.delayed(const Duration(seconds: 2));

      // Lista de aplicativos que seria carregada do Firebase Storage
      final List<AppItem> firebaseApps = [
        AppItem(
          name: 'Play center',
          iconUrl: 'https://via.placeholder.com/64x64/4CAF50/FFFFFF?text=PC',
          description: 'Central de aplicativos',
        ),
        AppItem(
          name: 'Ztube',
          iconUrl: 'https://via.placeholder.com/64x64/F44336/FFFFFF?text=ZT',
          description: 'Player de vídeos',
        ),
        AppItem(
          name: 'Play Dev console',
          iconUrl: 'https://via.placeholder.com/64x64/2196F3/FFFFFF?text=PD',
          description: 'Console de desenvolvimento',
        ),
        AppItem(
          name: 'Project Stores',
          iconUrl: 'https://via.placeholder.com/64x64/3F51B5/FFFFFF?text=PS',
          description: 'Gerenciador de projetos',
        ),
        AppItem(
          name: 'Gaming New games',
          iconUrl: 'https://via.placeholder.com/64x64/FF9800/FFFFFF?text=GN',
          description: 'Novos jogos e notícias',
        ),
      ];

      setState(() {
        apps = firebaseApps;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar aplicativos: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'App Stores Studio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tabs de navegação
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 0 ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'PUBLICADOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTab == 0 ? Colors.white : Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 1 ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'PRÉ-REGISTRO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedTab == 1 ? Colors.white : Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Seção "Meus Projetos"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Meus Projetos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Lista de aplicativos
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: apps.length,
                    itemBuilder: (context, index) {
                      return AppTile(app: apps[index]);
                    },
                  ),
          ),
        ],
      ),
      // Bottom Navigation Bar simulando os botões do Android
      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xFF1A1A1A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.circle, color: Colors.white, size: 20),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.crop_din, color: Colors.white, size: 24),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}