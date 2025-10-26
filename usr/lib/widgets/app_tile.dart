import 'package:flutter/material.dart';
import '../models/app_item.dart';

class AppTile extends StatelessWidget {
  final AppItem app;

  const AppTile({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Ícone do aplicativo
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(app.iconUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: app.iconUrl.contains('placeholder')
                ? Center(
                    child: Text(
                      app.name.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          // Informações do aplicativo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (app.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    app.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          // Botão de ação (opcional)
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
            onPressed: () {
              // Ação ao tocar no aplicativo
            },
          ),
        ],
      ),
    );
  }
}