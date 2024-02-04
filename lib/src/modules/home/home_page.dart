import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton<int>(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(child: Text('Iniciar Terminal'), value: 1),
                const PopupMenuItem<int>(child: Text('Finalizar Terminal'), value: 1),
              ];
            },
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 112),
          width: sizeOf.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bem Vindo', style: LabClinicasTheme.titleStyle),
              const SizedBox(height: 32),
              SizedBox(
                height: 48,
                width: sizeOf.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('INICIAR TERMINAL'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
