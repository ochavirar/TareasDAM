import 'package:desafio_de_4/Providers/profile_provider.dart';
import 'package:desafio_de_4/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileChanger extends StatelessWidget {
  const ProfileChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar perfil'),
      ),
      drawer: const DrawerContainer(),
      body: const UserForm(),
    );
  }
}

class UserForm extends StatelessWidget {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: context.watch<ProfileProvider>().name.toString());
    TextEditingController roleController = TextEditingController(text: context.watch<ProfileProvider>().role.toString());
    TextEditingController emailController = TextEditingController(text: context.watch<ProfileProvider>().email.toString());
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Rol',
            ),
            controller: roleController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
            ),
            controller: emailController,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProfileProvider>().updateData(
                nameController.text,
                roleController.text,
                emailController.text,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}