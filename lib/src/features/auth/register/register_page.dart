import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_button.dart';
import 'package:barbershop/src/features/auth/register/user_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
   nameEC.dispose();
   emailEC.dispose();
   passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVm = ref.watch(userRegisterVmProvider.notifier);
    ref.listen(userRegisterVmProvider, (_, state) {
      switch (state) {
        case UserRegisterStateStatus.initial:
        break;
        case UserRegisterStateStatus.success:
        Navigator.of(context).pushNamed('/auth/register/barbershop');
        case UserRegisterStateStatus.error:
        Messages.showError('Errro ao registar user administradir', context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome é orbrigatorio'),
                      Validatorless.min(3, 'Minimo 3c caracteres.'),
                    ]),
                    controller: nameEC,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      hintText: 'Nome',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.black),
                      helperStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail orbrigatorio'),
                      Validatorless.email('Email inválido'),
                    ]),
                    controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                      hintText: 'E-mail',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.black),
                      helperStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: false,
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha é orbrigatorio'),
                      Validatorless.min(6, 'Senha com minimo de 6 caracteres.'),
                     
                    ]),
                    controller: passwordEC,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                      //hintText: 'Senha',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.black),
                      helperStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onTapOutside: (_) => unfocus(context),
                    obscureText: false,
                    decoration: const InputDecoration(
                      label: Text('Confirmar Senha'),
                     // hintText: 'Senha',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.black),
                      helperStyle: TextStyle(color: Colors.black),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar a Senha obrigatório.'),
                      Validatorless.compare(passwordEC, 'Senhas diferente')
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: BarbershopButton(
                      height: 50,
                      width: double.infinity,
                      label: 'Registrar',
                      onPressed: () {
                        switch (formKey.currentState?.validate()) {
                          case null || false:
                            Messages.showError('Formulário inválido', context);
                          case true:
                            userRegisterVm.register(
                              name: nameEC.text,
                              email: emailEC.text,
                              password: passwordEC.text,
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
