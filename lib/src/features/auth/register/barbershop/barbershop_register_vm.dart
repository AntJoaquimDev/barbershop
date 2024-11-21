import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/features/auth/register/barbershop/barbershop_register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'barbershop_register_vm.g.dart';

@riverpod
class BarbershopRegisterVm extends _$BarbershopRegisterVm {
  @override
  BarbershopRegisterState build() => BarbershopRegisterState.initial();

  void addOrRemoveOpenDays(String weekDay) {
    final openingDays = state.openingDays;
    if (openingDays.contains(weekDay)) {
      openingDays.remove(weekDay);
    } else {
      openingDays.add(weekDay);
    }
    state = state.copyWith(openingDays: openingDays);
  }

  void addOrRemoveOpenHour(int hour) {
    final openingHours = state.openingHours;
    if (openingHours.contains(hour)) {
      openingHours.remove(hour);
    } else {
      openingHours.add(hour);
    }
    state = state.copyWith(openingHours: openingHours);
  }

  Future<void> register(String name, String email) async {
    final repository = ref.watch(barbershopRepositoyProvider);
    
    final BarbershopRegisterState(:openingDays, :openingHours) = state;

    final barbershopDto = (
      
      name: name,
      email : email,
      openingDays : openingDays,
      openingHours : openingHours
    );
    final registerResult=await repository.save(barbershopDto);


    switch(registerResult){
      case Success():
      ref.invalidate(getMyBarbersShopProvider);
      state=state.copyWith(status: BarbershopRegisterStateStatus.success);
      case Failure():
      state=state.copyWith(status: BarbershopRegisterStateStatus.error);
    }
  }
}
