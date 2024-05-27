import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalInformationController extends GetxController {
  RxBool isActiveButton = false.obs;
 
  RxBool tb = false.obs;
  RxBool xray = false.obs;
  RxBool chronic = false.obs;
  RxBool asthma = false.obs;
  RxBool copd = false.obs;
  RxBool oxygen = false.obs;
  RxBool sleep = false.obs;
  RxBool cpap = false.obs;
  RxBool lung = false.obs;
  RxBool lungcan = false.obs;
  RxBool histb = false.obs;
  RxBool blindness = false.obs;
  RxBool glaucoma = false.obs;
  RxBool diabeticre = false.obs;
  RxBool deafness = false.obs;
  RxBool hypertension = false.obs;
  RxBool frequentFluid = false.obs;
  RxBool congestive = false.obs;
  RxBool coronary = false.obs;
  RxBool heartattack = false.obs;
  RxBool heartsurgery = false.obs;
  RxBool poorcirculation = false.obs;
  RxBool paininleg = false.obs;
  RxBool amputations = false.obs;
  RxBool bloodclots = false.obs;
  
  var dateof = TextEditingController();
  var problem = TextEditingController();
  var cardiologistTele = TextEditingController();
  var vascularSurgeonTele = TextEditingController();
  var cardiologistName = TextEditingController();
  var vascularSurgeon = TextEditingController();


}
