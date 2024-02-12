import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  restart,
  done;
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);

  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void goPatient() {
    _step.forceUpdate(FormSteps.patient);
  }
}
