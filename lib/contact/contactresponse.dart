import 'package:get/get.dart';

class DropDownController extends GetxController {
  bool emdrop = false;
  bool orgdrop = false;
  bool povdrop = false;

  void toggleEmDrop() {
    emdrop=true;
    orgdrop = false;
    povdrop = false;
  }

  void toggleOrgDrop() {
    orgdrop=true;
    emdrop = false;
    povdrop = false;
  }

  void togglePovDrop() {
    povdrop = true;
    emdrop = false;
    orgdrop = false;
  }
}

