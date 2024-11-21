import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_button.dart';
import 'package:barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_state.dart';
import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class BarberShopRegisterPage extends ConsumerStatefulWidget {
  const BarberShopRegisterPage({super.key});

  @override
  ConsumerState<BarberShopRegisterPage> createState() =>
      _BarberShopRegisterPageState();
}

class _BarberShopRegisterPageState
    extends ConsumerState<BarberShopRegisterPage> {
  @override
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final nameEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbershopRegisterVM =
        ref.watch(barbershopRegisterVmProvider.notifier);

        ref.listen(barbershopRegisterVmProvider,(_,stat){
          switch(stat.status){
            case BarbershopRegisterStateStatus.initial:
            break;
            case BarbershopRegisterStateStatus.error:
            Messages.showError('Erro ao cadastrar estabecimento, desculpa', context);
            case BarbershopRegisterStateStatus.success:
            Navigator.of(context).pushNamedAndRemoveUntil('/home/adm', (route) => false);
          }
        });

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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onTapOutside: (_) => unfocus(context),
                      validator: Validatorless.multiple([
                        Validatorless.required('Nome orbrigatorio'),
                        Validatorless.min(3, 'no campo nome o minimo de caracteris é 3.')
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
                    WeekdaysPanel(onDayPressed: (value) {
                      barbershopRegisterVM.addOrRemoveOpenDays(value);
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    HoursPanel(
                      startTime: 8,
                      endTime: 22,
                      onHoursPressed: (int value) {
                        barbershopRegisterVM.addOrRemoveOpenHour(value);
                      },
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
                              Messages.showError(
                                  'Formulário inválido', context);
                            case true:
                              barbershopRegisterVM.register(
                                  nameEC.text, emailEC.text);
                              Messages.showSucces(
                                  'Usuário Criado com sucesso.', context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
