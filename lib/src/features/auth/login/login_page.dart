import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/features/auth/login/login_state.dart';
import 'package:barbershop/src/features/auth/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
    
    final LoginVm(:login) = ref.watch(loginVmProvider.notifier);
    ref.listen(loginVmProvider, (_, state) {
      switch (state) {
        case LoginState(status: LoginStateStatus.initial):     
          break;

        case LoginState(status: LoginStateStatus.error, :final errorMessage?):
    
          Messages.showError(errorMessage, context);

        case LoginState(status: LoginStateStatus.error):
      
          Messages.showError('Erro ao realizar login.', context);
          
        case LoginState(status: LoginStateStatus.admLogin):
       
          
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/adm', (route) => false);
          
        case LoginState(status: LoginStateStatus.employeeLogin):
       
        
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/employee', (route) => false);
        
      }
    });

    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageConstants.backgroundChair,
                  ),
                  opacity: 0.2,
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstants.imageLogo,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 24),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: TextStyle(color: Colors.black),
                                helperStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              obscureText: true,
                              onTapOutside: (_) => unfocus(context),
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha obrigatória'),
                                Validatorless.min(6,
                                    'Senha dever ter no minimo ¨caracteres.'),
                              ]),
                              controller: passwordEC,
                              decoration: const InputDecoration(
                                label: Text('Senha'),
                                hintText: 'Senha',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle: TextStyle(color: Colors.black),
                                helperStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    color: ColorsConstants.brow,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                )),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(56)),
                              onPressed: () {
                                switch (formKey.currentState?.validate()) {
                                  case (false || null):
                                    Messages.showError(
                                        'Campos inválidos', context);
                                    break;
                                  case true:
                                    login(emailEC.text, passwordEC.text);
                                    Messages.showSucces('seu login é valido.', context);
                                }
                              },
                              child: const Text('Acesar'),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/auth/register/user');
                              },
                            child:const Text(
                              'Criar conta',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
