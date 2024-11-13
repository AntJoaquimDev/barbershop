import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_button.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class BarberShopRegisterPage extends StatefulWidget {
  const BarberShopRegisterPage({super.key});

  @override
  State<BarberShopRegisterPage> createState() => _BarberShopRegisterPageState();
}

class _BarberShopRegisterPageState extends State<BarberShopRegisterPage> {
  @override
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome orbrigatorio'),
                      Validatorless.email('Nome inválido'),
                    ]),
                    controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      hintText: 'Nome',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.black),
                      helperStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onTapOutside: (_) => unfocus(context),
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail orbrigatorio'),
                      Validatorless.email('E-mail inválido'),
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
                  const SizedBox(height: 24),
                  const WeekdaysPanel(),
                  const SizedBox(
                    height: 24,
                  ),
                  const HoursPanel(
                    startTime: 8,
                    endTime: 22,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: BarbershopButton(
                      height: 50,
                      width: double.infinity,
                      label: 'Cadastrar Estabelecimento',
                      onPressed: () {
                        switch (formKey.currentState?.validate()) {
                          case null || false:
                            Messages.showError('Formulário inválido', context);
                          case true:
                            //userRegisterVm.register(
                            // name: nameEC.text,
                            // email: emailEC.text,
                            // password: passwordEC.text,

                            //);
                            Messages.showSucces(
                                'Usuário Criado com sucesso.', context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
