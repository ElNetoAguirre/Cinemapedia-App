import "package:flutter/material.dart";

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      "Comprando los boletos...",
      "Comprando palomitas de maíz...",
      "Entrando a la sala...",
      "Activando el modo vuelo...",
      "Cargando películas",
      "Ya casi terminamos...",
      "Ésto esta tardando más de lo esperado...",
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere por favor..."),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Cargando...");
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
