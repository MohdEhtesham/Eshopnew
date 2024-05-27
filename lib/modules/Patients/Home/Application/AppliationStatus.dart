class ApplicationStatus {
  Data? data;
  String? message;
  String? langCode;

  ApplicationStatus({this.data, this.message, this.langCode});

  ApplicationStatus.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    langCode = json['langCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['langCode'] = this.langCode;
    return data;
  }
}

class Data {
  String? id;
  AdditionalInformation? additionalInformation;
  AddonsInformation? addonsInformation;
  CancerScreening? cancerScreening;
  Documents? documents;
  List<String>? filledFields;
  GeneralInformation? generalInformation;
  InsuranceInfo? insuranceInfo;
  MedicalInformation1? medicalInformation1;
  MedicalInformation2? medicalInformation2;
  MedicalInformation3? medicalInformation3;
  MedicalInformation4? medicalInformation4;
  MedicareMedicaidInfo? medicareMedicaidInfo;
  List<String>? medicationsName;
  PatientInfo? patientInfo;
  int? percentage;
  ReferringPhysician? referringPhysician;
  SpecialConcerns? specialConcerns;
  String? userId;

  Data(
      {this.id,
      this.additionalInformation,
      this.addonsInformation,
      this.cancerScreening,
      this.documents,
      this.filledFields,
      this.generalInformation,
      this.insuranceInfo,
      this.medicalInformation1,
      this.medicalInformation2,
      this.medicalInformation3,
      this.medicalInformation4,
      this.medicareMedicaidInfo,
      this.medicationsName,
      this.patientInfo,
      this.percentage,
      this.referringPhysician,
      this.specialConcerns,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    additionalInformation = json['additional_information'] != null
        ? new AdditionalInformation.fromJson(json['additional_information'])
        : null;
    addonsInformation = json['addons_information'] != null
        ? new AddonsInformation.fromJson(json['addons_information'])
        : null;
    cancerScreening = json['cancer_screening'] != null
        ? new CancerScreening.fromJson(json['cancer_screening'])
        : null;
    documents = json['documents'] != null
        ? new Documents.fromJson(json['documents'])
        : null;
    filledFields = json['filled_fields'].cast<String>();
    generalInformation = json['general_information'] != null
        ? new GeneralInformation.fromJson(json['general_information'])
        : null;
    insuranceInfo = json['insurance_info'] != null
        ? new InsuranceInfo.fromJson(json['insurance_info'])
        : null;
    medicalInformation1 = json['medical_information_1'] != null
        ? new MedicalInformation1.fromJson(json['medical_information_1'])
        : null;
    medicalInformation2 = json['medical_information_2'] != null
        ? new MedicalInformation2.fromJson(json['medical_information_2'])
        : null;
    medicalInformation3 = json['medical_information_3'] != null
        ? new MedicalInformation3.fromJson(json['medical_information_3'])
        : null;
    medicalInformation4 = json['medical_information_4'] != null
        ? new MedicalInformation4.fromJson(json['medical_information_4'])
        : null;
    medicareMedicaidInfo = json['medicare_medicaid_info'] != null
        ? new MedicareMedicaidInfo.fromJson(json['medicare_medicaid_info'])
        : null;
    medicationsName = json['medications_name'].cast<String>();
    patientInfo = json['patient_info'] != null
        ? new PatientInfo.fromJson(json['patient_info'])
        : null;
    percentage = json['percentage'];
    referringPhysician = json['referring_physician'] != null
        ? new ReferringPhysician.fromJson(json['referring_physician'])
        : null;
    specialConcerns = json['special_concerns'] != null
        ? new SpecialConcerns.fromJson(json['special_concerns'])
        : null;
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.additionalInformation != null) {
      data['additional_information'] = this.additionalInformation!.toJson();
    }
    if (this.addonsInformation != null) {
      data['addons_information'] = this.addonsInformation!.toJson();
    }
    if (this.cancerScreening != null) {
      data['cancer_screening'] = this.cancerScreening!.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.toJson();
    }
    data['filled_fields'] = this.filledFields;
    if (this.generalInformation != null) {
      data['general_information'] = this.generalInformation!.toJson();
    }
    if (this.insuranceInfo != null) {
      data['insurance_info'] = this.insuranceInfo!.toJson();
    }
    if (this.medicalInformation1 != null) {
      data['medical_information_1'] = this.medicalInformation1!.toJson();
    }
    if (this.medicalInformation2 != null) {
      data['medical_information_2'] = this.medicalInformation2!.toJson();
    }
    if (this.medicalInformation3 != null) {
      data['medical_information_3'] = this.medicalInformation3!.toJson();
    }
    if (this.medicalInformation4 != null) {
      data['medical_information_4'] = this.medicalInformation4!.toJson();
    }
    if (this.medicareMedicaidInfo != null) {
      data['medicare_medicaid_info'] = this.medicareMedicaidInfo!.toJson();
    }
    data['medications_name'] = this.medicationsName;
    if (this.patientInfo != null) {
      data['patient_info'] = this.patientInfo!.toJson();
    }
    data['percentage'] = this.percentage;
    if (this.referringPhysician != null) {
      data['referring_physician'] = this.referringPhysician!.toJson();
    }
    if (this.specialConcerns != null) {
      data['special_concerns'] = this.specialConcerns!.toJson();
    }
    data['user_id'] = this.userId;
    return data;
  }
}

class AdditionalInformation {
  String? dateOfFirstDialysis;
  DialysisCenter? dialysisCenter;
  String? dialysisDays;
  String? dialysisType;
  int? height;
  String? previousTransplant;
  int? weight;

  AdditionalInformation(
      {this.dateOfFirstDialysis,
      this.dialysisCenter,
      this.dialysisDays,
      this.dialysisType,
      this.height,
      this.previousTransplant,
      this.weight});

  AdditionalInformation.fromJson(Map<String, dynamic> json) {
    dateOfFirstDialysis = json['date_of_first_dialysis'];
    dialysisCenter = json['dialysis_center'] != null
        ? new DialysisCenter.fromJson(json['dialysis_center'])
        : null;
    dialysisDays = json['dialysis_days'];
    dialysisType = json['dialysis_type'];
    height = json['height'];
    previousTransplant = json['previous_transplant'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_of_first_dialysis'] = this.dateOfFirstDialysis;
    if (this.dialysisCenter != null) {
      data['dialysis_center'] = this.dialysisCenter!.toJson();
    }
    data['dialysis_days'] = this.dialysisDays;
    data['dialysis_type'] = this.dialysisType;
    data['height'] = this.height;
    data['previous_transplant'] = this.previousTransplant;
    data['weight'] = this.weight;
    return data;
  }
}

class DialysisCenter {
  String? city;
  String? name;
  String? phoneNumber;
  String? socialWorker;

  DialysisCenter({this.city, this.name, this.phoneNumber, this.socialWorker});

  DialysisCenter.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    socialWorker = json['social_worker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['social_worker'] = this.socialWorker;
    return data;
  }
}

class AddonsInformation {
  bool? anesthesiaComplications;
  String? anesthesiaComplicationsList;
  bool? dialysisAccessProblems;
  String? hospitalizationList;
  bool? hospitalizationPastYear;
  String? otherMedicalProblem;
  bool? surgeries;
  String? surgeryList;
  bool? willingToReceiveBloodProducts;

  AddonsInformation(
      {this.anesthesiaComplications,
      this.anesthesiaComplicationsList,
      this.dialysisAccessProblems,
      this.hospitalizationList,
      this.hospitalizationPastYear,
      this.otherMedicalProblem,
      this.surgeries,
      this.surgeryList,
      this.willingToReceiveBloodProducts});

  AddonsInformation.fromJson(Map<String, dynamic> json) {
    anesthesiaComplications = json['anesthesia_complications'];
    anesthesiaComplicationsList = json['anesthesia_complications_list'];
    dialysisAccessProblems = json['dialysis_access_problems'];
    hospitalizationList = json['hospitalization_list'];
    hospitalizationPastYear = json['hospitalization_past_year'];
    otherMedicalProblem = json['other_medical_problem'];
    surgeries = json['surgeries'];
    surgeryList = json['surgery_list'];
    willingToReceiveBloodProducts = json['willing_to_receive_blood_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anesthesia_complications'] = this.anesthesiaComplications;
    data['anesthesia_complications_list'] = this.anesthesiaComplicationsList;
    data['dialysis_access_problems'] = this.dialysisAccessProblems;
    data['hospitalization_list'] = this.hospitalizationList;
    data['hospitalization_past_year'] = this.hospitalizationPastYear;
    data['other_medical_problem'] = this.otherMedicalProblem;
    data['surgeries'] = this.surgeries;
    data['surgery_list'] = this.surgeryList;
    data['willing_to_receive_blood_products'] =
        this.willingToReceiveBloodProducts;
    return data;
  }
}

class CancerScreening {
  Colonoscopy? colonoscopy;
  Colonoscopy? mammogram;
  Colonoscopy? papSmear;

  CancerScreening({this.colonoscopy, this.mammogram, this.papSmear});

  CancerScreening.fromJson(Map<String, dynamic> json) {
    colonoscopy = json['colonoscopy'] != null
        ? new Colonoscopy.fromJson(json['colonoscopy'])
        : null;
    mammogram = json['mammogram'] != null
        ? new Colonoscopy.fromJson(json['mammogram'])
        : null;
    papSmear = json['pap_smear'] != null
        ? new Colonoscopy.fromJson(json['pap_smear'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.colonoscopy != null) {
      data['colonoscopy'] = this.colonoscopy!.toJson();
    }
    if (this.mammogram != null) {
      data['mammogram'] = this.mammogram!.toJson();
    }
    if (this.papSmear != null) {
      data['pap_smear'] = this.papSmear!.toJson();
    }
    return data;
  }
}

class Colonoscopy {
  String? docResult;
  String? type;
  String? when;
  String? where;

  Colonoscopy({this.docResult, this.type, this.when, this.where});

  Colonoscopy.fromJson(Map<String, dynamic> json) {
    docResult = json['doc_result'];
    type = json['type'];
    when = json['when'];
    where = json['where'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_result'] = this.docResult;
    data['type'] = this.type;
    data['when'] = this.when;
    data['where'] = this.where;
    return data;
  }
}

class Documents {
  String? driverLicenseOrPassport;
  String? egfr;
  String? hWFromNeophrologistOrCenter;
  String? hcfa;
  String? historyOfCompliance;
  String? historyPhysicalFromNeophrologist;
  String? insuranceCardBack;
  String? insuranceCardFront;
  String? tbTest;

  Documents(
      {this.driverLicenseOrPassport,
      this.egfr,
      this.hWFromNeophrologistOrCenter,
      this.hcfa,
      this.historyOfCompliance,
      this.historyPhysicalFromNeophrologist,
      this.insuranceCardBack,
      this.insuranceCardFront,
      this.tbTest});

  Documents.fromJson(Map<String, dynamic> json) {
    driverLicenseOrPassport = json['driver_license_or_passport'];
    egfr = json['egfr'];
    hWFromNeophrologistOrCenter = json['h_w_from_neophrologist_or_center'];
    hcfa = json['hcfa'];
    historyOfCompliance = json['history_of_compliance'];
    historyPhysicalFromNeophrologist =
        json['history_physical_from_neophrologist'];
    insuranceCardBack = json['insurance_card_back'];
    insuranceCardFront = json['insurance_card_front'];
    tbTest = json['tb_test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_license_or_passport'] = this.driverLicenseOrPassport;
    data['egfr'] = this.egfr;
    data['h_w_from_neophrologist_or_center'] = this.hWFromNeophrologistOrCenter;
    data['hcfa'] = this.hcfa;
    data['history_of_compliance'] = this.historyOfCompliance;
    data['history_physical_from_neophrologist'] =
        this.historyPhysicalFromNeophrologist;
    data['insurance_card_back'] = this.insuranceCardBack;
    data['insurance_card_front'] = this.insuranceCardFront;
    data['tb_test'] = this.tbTest;
    return data;
  }
}

class GeneralInformation {
  OccupationalInformation? occupationalInformation;
  SocialHistory? socialHistory;

  GeneralInformation({this.occupationalInformation, this.socialHistory});

  GeneralInformation.fromJson(Map<String, dynamic> json) {
    occupationalInformation = json['occupational_information'] != null
        ? new OccupationalInformation.fromJson(json['occupational_information'])
        : null;
    socialHistory = json['social_history'] != null
        ? new SocialHistory.fromJson(json['social_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.occupationalInformation != null) {
      data['occupational_information'] = this.occupationalInformation!.toJson();
    }
    if (this.socialHistory != null) {
      data['social_history'] = this.socialHistory!.toJson();
    }
    return data;
  }
}

class OccupationalInformation {
  String? heavyLifting;
  String? workOutdoors;
  String? workStatus;

  OccupationalInformation(
      {this.heavyLifting, this.workOutdoors, this.workStatus});

  OccupationalInformation.fromJson(Map<String, dynamic> json) {
    heavyLifting = json['heavy_lifting'];
    workOutdoors = json['work_outdoors'];
    workStatus = json['work_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heavy_lifting'] = this.heavyLifting;
    data['work_outdoors'] = this.workOutdoors;
    data['work_status'] = this.workStatus;
    return data;
  }
}

class SocialHistory {
  String? alcohol;
  String? drugs;
  String? smoke;

  SocialHistory({this.alcohol, this.drugs, this.smoke});

  SocialHistory.fromJson(Map<String, dynamic> json) {
    alcohol = json['alcohol'];
    drugs = json['drugs'];
    smoke = json['smoke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alcohol'] = this.alcohol;
    data['drugs'] = this.drugs;
    data['smoke'] = this.smoke;
    return data;
  }
}

class InsuranceInfo {
  int? customerService;
  String? dob;
  String? groupNumber;
  String? insuranceCompany;
  String? insurancePremiumPaidBy;
  int? insuranceSocialSecurity;
  String? policyId;
  String? primaryPolicyHolderName;

  InsuranceInfo(
      {this.customerService,
      this.dob,
      this.groupNumber,
      this.insuranceCompany,
      this.insurancePremiumPaidBy,
      this.insuranceSocialSecurity,
      this.policyId,
      this.primaryPolicyHolderName});

  InsuranceInfo.fromJson(Map<String, dynamic> json) {
    customerService = json['customer_service'];
    dob = json['dob'];
    groupNumber = json['group_number'];
    insuranceCompany = json['insurance_company'];
    insurancePremiumPaidBy = json['insurance_premium_paid_by'];
    insuranceSocialSecurity = json['insurance_social_security'];
    policyId = json['policy_id'];
    primaryPolicyHolderName = json['primary_policy_holder_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_service'] = this.customerService;
    data['dob'] = this.dob;
    data['group_number'] = this.groupNumber;
    data['insurance_company'] = this.insuranceCompany;
    data['insurance_premium_paid_by'] = this.insurancePremiumPaidBy;
    data['insurance_social_security'] = this.insuranceSocialSecurity;
    data['policy_id'] = this.policyId;
    data['primary_policy_holder_name'] = this.primaryPolicyHolderName;
    return data;
  }
}

class MedicalInformation1 {
  CariacVascular? cariacVascular;
  EyeEarNoseThroat? eyeEarNoseThroat;
  PulmonaryLungs? pulmonaryLungs;

  MedicalInformation1(
      {this.cariacVascular, this.eyeEarNoseThroat, this.pulmonaryLungs});

  MedicalInformation1.fromJson(Map<String, dynamic> json) {
    cariacVascular = json['cariac_vascular'] != null
        ? new CariacVascular.fromJson(json['cariac_vascular'])
        : null;
    eyeEarNoseThroat = json['eye_ear_nose_throat'] != null
        ? new EyeEarNoseThroat.fromJson(json['eye_ear_nose_throat'])
        : null;
    pulmonaryLungs = json['pulmonary_lungs'] != null
        ? new PulmonaryLungs.fromJson(json['pulmonary_lungs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cariacVascular != null) {
      data['cariac_vascular'] = this.cariacVascular!.toJson();
    }
    if (this.eyeEarNoseThroat != null) {
      data['eye_ear_nose_throat'] = this.eyeEarNoseThroat!.toJson();
    }
    if (this.pulmonaryLungs != null) {
      data['pulmonary_lungs'] = this.pulmonaryLungs!.toJson();
    }
    return data;
  }
}

class CariacVascular {
  String? additionalProblem;
  bool? amputations;
  bool? bloodClotsDvt;
  String? cardiogistNumber;
  String? cardiolgist;
  bool? congestiveHearFailure;
  bool? coronaryArteryHeaerDisease;
  bool? frequentFluidOverload;
  bool? hearAttac;
  bool? heartSurgery;
  bool? hypertensionHighBp;
  bool? legsPainWhenWalking;
  bool? poorCirculation;
  bool? vascularSurgeon;
  String? vascularSurgeonNumber;

  CariacVascular(
      {this.additionalProblem,
      this.amputations,
      this.bloodClotsDvt,
      this.cardiogistNumber,
      this.cardiolgist,
      this.congestiveHearFailure,
      this.coronaryArteryHeaerDisease,
      this.frequentFluidOverload,
      this.hearAttac,
      this.heartSurgery,
      this.hypertensionHighBp,
      this.legsPainWhenWalking,
      this.poorCirculation,
      this.vascularSurgeon,
      this.vascularSurgeonNumber});

  CariacVascular.fromJson(Map<String, dynamic> json) {
    additionalProblem = json['additional_problem'];
    amputations = json['amputations'];
    bloodClotsDvt = json['blood_clots_dvt'];
    cardiogistNumber = json['cardiogist_number'];
    cardiolgist = json['cardiolgist'];
    congestiveHearFailure = json['congestive_hear_failure'];
    coronaryArteryHeaerDisease = json['coronary_artery_heaer_disease'];
    frequentFluidOverload = json['frequent_fluid_overload'];
    hearAttac = json['hear_attac'];
    heartSurgery = json['heart_surgery'];
    hypertensionHighBp = json['hypertension_high_bp'];
    legsPainWhenWalking = json['legs_pain_when_walking'];
    poorCirculation = json['poor_circulation'];
    vascularSurgeon = json['vascular_surgeon'];
    vascularSurgeonNumber = json['vascular_surgeon_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_problem'] = this.additionalProblem;
    data['amputations'] = this.amputations;
    data['blood_clots_dvt'] = this.bloodClotsDvt;
    data['cardiogist_number'] = this.cardiogistNumber;
    data['cardiolgist'] = this.cardiolgist;
    data['congestive_hear_failure'] = this.congestiveHearFailure;
    data['coronary_artery_heaer_disease'] = this.coronaryArteryHeaerDisease;
    data['frequent_fluid_overload'] = this.frequentFluidOverload;
    data['hear_attac'] = this.hearAttac;
    data['heart_surgery'] = this.heartSurgery;
    data['hypertension_high_bp'] = this.hypertensionHighBp;
    data['legs_pain_when_walking'] = this.legsPainWhenWalking;
    data['poor_circulation'] = this.poorCirculation;
    data['vascular_surgeon'] = this.vascularSurgeon;
    data['vascular_surgeon_number'] = this.vascularSurgeonNumber;
    return data;
  }
}

class EyeEarNoseThroat {
  String? additionProblem;
  bool? blindness;
  bool? deafnessHearingLoss;
  bool? diabeticRetinopathy;
  bool? glaucoma;

  EyeEarNoseThroat(
      {this.additionProblem,
      this.blindness,
      this.deafnessHearingLoss,
      this.diabeticRetinopathy,
      this.glaucoma});

  EyeEarNoseThroat.fromJson(Map<String, dynamic> json) {
    additionProblem = json['addition_problem'];
    blindness = json['blindness'];
    deafnessHearingLoss = json['deafness_hearing_loss'];
    diabeticRetinopathy = json['diabetic_retinopathy'];
    glaucoma = json['glaucoma'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addition_problem'] = this.additionProblem;
    data['blindness'] = this.blindness;
    data['deafness_hearing_loss'] = this.deafnessHearingLoss;
    data['diabetic_retinopathy'] = this.diabeticRetinopathy;
    data['glaucoma'] = this.glaucoma;
    return data;
  }
}

class PulmonaryLungs {
  bool? abnormalChestXray;
  bool? asthama;
  bool? chronicBronchitis;
  bool? cpapUse;
  bool? emphysemaCopd;
  bool? lungCancer;
  bool? lungMassesNodules;
  bool? oxygenUse;
  bool? positiveTbSkinTest;
  String? positiveTbSkinTestDate;
  bool? sleepApnea;
  bool? tbTuberculosis;

  PulmonaryLungs(
      {this.abnormalChestXray,
      this.asthama,
      this.chronicBronchitis,
      this.cpapUse,
      this.emphysemaCopd,
      this.lungCancer,
      this.lungMassesNodules,
      this.oxygenUse,
      this.positiveTbSkinTest,
      this.positiveTbSkinTestDate,
      this.sleepApnea,
      this.tbTuberculosis});

  PulmonaryLungs.fromJson(Map<String, dynamic> json) {
    abnormalChestXray = json['abnormal_chest_xray'];
    asthama = json['asthama'];
    chronicBronchitis = json['chronic_bronchitis'];
    cpapUse = json['cpap_use'];
    emphysemaCopd = json['emphysema_copd'];
    lungCancer = json['lung_cancer'];
    lungMassesNodules = json['lung_masses_nodules'];
    oxygenUse = json['oxygen_use'];
    positiveTbSkinTest = json['positive_tb_skin_test'];
    positiveTbSkinTestDate = json['positive_tb_skin_test_date'];
    sleepApnea = json['sleep_apnea'];
    tbTuberculosis = json['tb_tuberculosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abnormal_chest_xray'] = this.abnormalChestXray;
    data['asthama'] = this.asthama;
    data['chronic_bronchitis'] = this.chronicBronchitis;
    data['cpap_use'] = this.cpapUse;
    data['emphysema_copd'] = this.emphysemaCopd;
    data['lung_cancer'] = this.lungCancer;
    data['lung_masses_nodules'] = this.lungMassesNodules;
    data['oxygen_use'] = this.oxygenUse;
    data['positive_tb_skin_test'] = this.positiveTbSkinTest;
    data['positive_tb_skin_test_date'] = this.positiveTbSkinTestDate;
    data['sleep_apnea'] = this.sleepApnea;
    data['tb_tuberculosis'] = this.tbTuberculosis;
    return data;
  }
}

class MedicalInformation2 {
  Endocrinology? endocrinology;
  Gastroenology? gastroenology;
  NephrologyUrology? nephrologyUrology;

  MedicalInformation2(
      {this.endocrinology, this.gastroenology, this.nephrologyUrology});

  MedicalInformation2.fromJson(Map<String, dynamic> json) {
    endocrinology = json['endocrinology'] != null
        ? new Endocrinology.fromJson(json['endocrinology'])
        : null;
    gastroenology = json['gastroenology'] != null
        ? new Gastroenology.fromJson(json['gastroenology'])
        : null;
    nephrologyUrology = json['nephrology_urology'] != null
        ? new NephrologyUrology.fromJson(json['nephrology_urology'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.endocrinology != null) {
      data['endocrinology'] = this.endocrinology!.toJson();
    }
    if (this.gastroenology != null) {
      data['gastroenology'] = this.gastroenology!.toJson();
    }
    if (this.nephrologyUrology != null) {
      data['nephrology_urology'] = this.nephrologyUrology!.toJson();
    }
    return data;
  }
}

class Endocrinology {
  String? endocrinologist;
  String? endocrinologistNumber;
  String? hospitalizationsRelatedToDiabetes;
  bool? thyroidNoduleMasses;
  bool? thyroidSurgicallyRemoved;
  String? type1AgeOfDiagnosis;
  String? type2AgeOfDiagnosis;

  Endocrinology(
      {this.endocrinologist,
      this.endocrinologistNumber,
      this.hospitalizationsRelatedToDiabetes,
      this.thyroidNoduleMasses,
      this.thyroidSurgicallyRemoved,
      this.type1AgeOfDiagnosis,
      this.type2AgeOfDiagnosis});

  Endocrinology.fromJson(Map<String, dynamic> json) {
    endocrinologist = json['endocrinologist'];
    endocrinologistNumber = json['endocrinologist_number'];
    hospitalizationsRelatedToDiabetes =
        json['hospitalizations_related_to_diabetes'];
    thyroidNoduleMasses = json['thyroid_nodule_masses'];
    thyroidSurgicallyRemoved = json['thyroid_surgically_removed'];
    type1AgeOfDiagnosis = json['type1_age_of_diagnosis'];
    type2AgeOfDiagnosis = json['type2_age_of_diagnosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endocrinologist'] = this.endocrinologist;
    data['endocrinologist_number'] = this.endocrinologistNumber;
    data['hospitalizations_related_to_diabetes'] =
        this.hospitalizationsRelatedToDiabetes;
    data['thyroid_nodule_masses'] = this.thyroidNoduleMasses;
    data['thyroid_surgically_removed'] = this.thyroidSurgicallyRemoved;
    data['type1_age_of_diagnosis'] = this.type1AgeOfDiagnosis;
    data['type2_age_of_diagnosis'] = this.type2AgeOfDiagnosis;
    return data;
  }
}

class Gastroenology {
  String? additionalProblem;
  String? coloscopyIfYesWhen;
  String? coloscopyIfYesWhy;
  String? everHadColoscopy;
  String? gastroenterologist;
  String? gastroenterologistNumber;
  String? hepatologist;
  String? hepatologistNumber;
  bool? historyBloodStools;
  bool? historyHepatitisBVaccine;
  bool? historyHepatitisC;
  bool? historyIntestinalProblem;
  bool? historyPolyps;
  bool? historyVomitingBlood;
  bool? liverDisease;
  bool? probleSwallowing;
  bool? recievedHepatitisBVaccine;
  bool? refluxHeaerburn;
  bool? stomachUlcer;

  Gastroenology(
      {this.additionalProblem,
      this.coloscopyIfYesWhen,
      this.coloscopyIfYesWhy,
      this.everHadColoscopy,
      this.gastroenterologist,
      this.gastroenterologistNumber,
      this.hepatologist,
      this.hepatologistNumber,
      this.historyBloodStools,
      this.historyHepatitisBVaccine,
      this.historyHepatitisC,
      this.historyIntestinalProblem,
      this.historyPolyps,
      this.historyVomitingBlood,
      this.liverDisease,
      this.probleSwallowing,
      this.recievedHepatitisBVaccine,
      this.refluxHeaerburn,
      this.stomachUlcer});

  Gastroenology.fromJson(Map<String, dynamic> json) {
    additionalProblem = json['additional_problem'];
    coloscopyIfYesWhen = json['coloscopy_if_yes_when'];
    coloscopyIfYesWhy = json['coloscopy_if_yes_why'];
    everHadColoscopy = json['ever_had_coloscopy'];
    gastroenterologist = json['gastroenterologist'];
    gastroenterologistNumber = json['gastroenterologist_number'];
    hepatologist = json['hepatologist'];
    hepatologistNumber = json['hepatologist_number'];
    historyBloodStools = json['history_blood_stools'];
    historyHepatitisBVaccine = json['history_hepatitis_b_vaccine'];
    historyHepatitisC = json['history_hepatitis_c'];
    historyIntestinalProblem = json['history_intestinal_problem'];
    historyPolyps = json['history_polyps'];
    historyVomitingBlood = json['history_vomiting_blood'];
    liverDisease = json['liver_disease'];
    probleSwallowing = json['proble_swallowing'];
    recievedHepatitisBVaccine = json['recieved_hepatitis_b_vaccine'];
    refluxHeaerburn = json['reflux_heaerburn'];
    stomachUlcer = json['stomach_ulcer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_problem'] = this.additionalProblem;
    data['coloscopy_if_yes_when'] = this.coloscopyIfYesWhen;
    data['coloscopy_if_yes_why'] = this.coloscopyIfYesWhy;
    data['ever_had_coloscopy'] = this.everHadColoscopy;
    data['gastroenterologist'] = this.gastroenterologist;
    data['gastroenterologist_number'] = this.gastroenterologistNumber;
    data['hepatologist'] = this.hepatologist;
    data['hepatologist_number'] = this.hepatologistNumber;
    data['history_blood_stools'] = this.historyBloodStools;
    data['history_hepatitis_b_vaccine'] = this.historyHepatitisBVaccine;
    data['history_hepatitis_c'] = this.historyHepatitisC;
    data['history_intestinal_problem'] = this.historyIntestinalProblem;
    data['history_polyps'] = this.historyPolyps;
    data['history_vomiting_blood'] = this.historyVomitingBlood;
    data['liver_disease'] = this.liverDisease;
    data['proble_swallowing'] = this.probleSwallowing;
    data['recieved_hepatitis_b_vaccine'] = this.recievedHepatitisBVaccine;
    data['reflux_heaerburn'] = this.refluxHeaerburn;
    data['stomach_ulcer'] = this.stomachUlcer;
    return data;
  }
}

class NephrologyUrology {
  String? additionalProblem;
  bool? frequentBladderInfections;
  bool? historyKidneyInfection;
  String? historyKidneyInfectionWhen;
  bool? oneKidneyRemoved;
  String? urologist;
  String? urologistNumber;
  String? whichKidneyRemoved;

  NephrologyUrology(
      {this.additionalProblem,
      this.frequentBladderInfections,
      this.historyKidneyInfection,
      this.historyKidneyInfectionWhen,
      this.oneKidneyRemoved,
      this.urologist,
      this.urologistNumber,
      this.whichKidneyRemoved});

  NephrologyUrology.fromJson(Map<String, dynamic> json) {
    additionalProblem = json['additional_problem'];
    frequentBladderInfections = json['frequent_bladder_infections'];
    historyKidneyInfection = json['history_kidney_infection'];
    historyKidneyInfectionWhen = json['history_kidney_infection_when'];
    oneKidneyRemoved = json['one_kidney_removed'];
    urologist = json['urologist'];
    urologistNumber = json['urologist_number'];
    whichKidneyRemoved = json['which_kidney_removed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_problem'] = this.additionalProblem;
    data['frequent_bladder_infections'] = this.frequentBladderInfections;
    data['history_kidney_infection'] = this.historyKidneyInfection;
    data['history_kidney_infection_when'] = this.historyKidneyInfectionWhen;
    data['one_kidney_removed'] = this.oneKidneyRemoved;
    data['urologist'] = this.urologist;
    data['urologist_number'] = this.urologistNumber;
    data['which_kidney_removed'] = this.whichKidneyRemoved;
    return data;
  }
}

class MedicalInformation3 {
  Gynecology? gynecology;
  HemtologyOncologyRheumatology? hemtologyOncologyRheumatology;
  Neurology? neurology;

  MedicalInformation3(
      {this.gynecology, this.hemtologyOncologyRheumatology, this.neurology});

  MedicalInformation3.fromJson(Map<String, dynamic> json) {
    gynecology = json['gynecology'] != null
        ? new Gynecology.fromJson(json['gynecology'])
        : null;
    hemtologyOncologyRheumatology =
        json['hemtology_oncology_rheumatology'] != null
            ? new HemtologyOncologyRheumatology.fromJson(
                json['hemtology_oncology_rheumatology'])
            : null;
    neurology = json['neurology'] != null
        ? new Neurology.fromJson(json['neurology'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gynecology != null) {
      data['gynecology'] = this.gynecology!.toJson();
    }
    if (this.hemtologyOncologyRheumatology != null) {
      data['hemtology_oncology_rheumatology'] =
          this.hemtologyOncologyRheumatology!.toJson();
    }
    if (this.neurology != null) {
      data['neurology'] = this.neurology!.toJson();
    }
    return data;
  }
}

class Gynecology {
  bool? abnormalMammogram;
  String? abnormalPapSmear;
  String? additionalProblem;
  bool? everHadHysterectomy;
  String? gynecologist;
  String? gynecologistNumber;
  bool? historyBreastBiopsy;
  bool? historyBreastLumpsMasses;

  Gynecology(
      {this.abnormalMammogram,
      this.abnormalPapSmear,
      this.additionalProblem,
      this.everHadHysterectomy,
      this.gynecologist,
      this.gynecologistNumber,
      this.historyBreastBiopsy,
      this.historyBreastLumpsMasses});

  Gynecology.fromJson(Map<String, dynamic> json) {
    abnormalMammogram = json['abnormal_mammogram'];
    abnormalPapSmear = json['abnormal_pap_smear'];
    additionalProblem = json['additional_problem'];
    everHadHysterectomy = json['ever_had_hysterectomy'];
    gynecologist = json['gynecologist'];
    gynecologistNumber = json['gynecologist_number'];
    historyBreastBiopsy = json['history_breast_biopsy'];
    historyBreastLumpsMasses = json['history_breast_lumps_masses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abnormal_mammogram'] = this.abnormalMammogram;
    data['abnormal_pap_smear'] = this.abnormalPapSmear;
    data['additional_problem'] = this.additionalProblem;
    data['ever_had_hysterectomy'] = this.everHadHysterectomy;
    data['gynecologist'] = this.gynecologist;
    data['gynecologist_number'] = this.gynecologistNumber;
    data['history_breast_biopsy'] = this.historyBreastBiopsy;
    data['history_breast_lumps_masses'] = this.historyBreastLumpsMasses;
    return data;
  }
}

class HemtologyOncologyRheumatology {
  String? additionalProblem;
  bool? amyloidosis;
  bool? everHadBloodTransusion;
  bool? goodpasturesDisease;
  bool? hemophilla;
  bool? historyBleedingProblem;
  String? historyOfCancer;
  String? oncologist;
  String? oncologistNumber;
  String? rheumatologist;
  String? rheumatologistNumber;
  bool? sickleCellDisease;
  bool? vasculitis;

  HemtologyOncologyRheumatology(
      {this.additionalProblem,
      this.amyloidosis,
      this.everHadBloodTransusion,
      this.goodpasturesDisease,
      this.hemophilla,
      this.historyBleedingProblem,
      this.historyOfCancer,
      this.oncologist,
      this.oncologistNumber,
      this.rheumatologist,
      this.rheumatologistNumber,
      this.sickleCellDisease,
      this.vasculitis});

  HemtologyOncologyRheumatology.fromJson(Map<String, dynamic> json) {
    additionalProblem = json['additional_problem'];
    amyloidosis = json['amyloidosis'];
    everHadBloodTransusion = json['ever_had_blood_transusion'];
    goodpasturesDisease = json['goodpastures_disease'];
    hemophilla = json['hemophilla'];
    historyBleedingProblem = json['history_bleeding_problem'];
    historyOfCancer = json['history_of_cancer'];
    oncologist = json['oncologist'];
    oncologistNumber = json['oncologist_number'];
    rheumatologist = json['rheumatologist'];
    rheumatologistNumber = json['rheumatologist_number'];
    sickleCellDisease = json['sickle_cell_disease'];
    vasculitis = json['vasculitis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_problem'] = this.additionalProblem;
    data['amyloidosis'] = this.amyloidosis;
    data['ever_had_blood_transusion'] = this.everHadBloodTransusion;
    data['goodpastures_disease'] = this.goodpasturesDisease;
    data['hemophilla'] = this.hemophilla;
    data['history_bleeding_problem'] = this.historyBleedingProblem;
    data['history_of_cancer'] = this.historyOfCancer;
    data['oncologist'] = this.oncologist;
    data['oncologist_number'] = this.oncologistNumber;
    data['rheumatologist'] = this.rheumatologist;
    data['rheumatologist_number'] = this.rheumatologistNumber;
    data['sickle_cell_disease'] = this.sickleCellDisease;
    data['vasculitis'] = this.vasculitis;
    return data;
  }
}

class Neurology {
  String? addtionalProblem;
  bool? headInjury;
  bool? headaches;
  String? neurologist;
  String? neurologistNumber;
  bool? seizures;
  bool? spinalCordInjury;
  bool? stroke;

  Neurology(
      {this.addtionalProblem,
      this.headInjury,
      this.headaches,
      this.neurologist,
      this.neurologistNumber,
      this.seizures,
      this.spinalCordInjury,
      this.stroke});

  Neurology.fromJson(Map<String, dynamic> json) {
    addtionalProblem = json['addtional_problem'];
    headInjury = json['head_injury'];
    headaches = json['headaches'];
    neurologist = json['neurologist'];
    neurologistNumber = json['neurologist_number'];
    seizures = json['seizures'];
    spinalCordInjury = json['spinal_cord_injury'];
    stroke = json['stroke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addtional_problem'] = this.addtionalProblem;
    data['head_injury'] = this.headInjury;
    data['headaches'] = this.headaches;
    data['neurologist'] = this.neurologist;
    data['neurologist_number'] = this.neurologistNumber;
    data['seizures'] = this.seizures;
    data['spinal_cord_injury'] = this.spinalCordInjury;
    data['stroke'] = this.stroke;
    return data;
  }
}

class MedicalInformation4 {
  Dermatology? dermatology;
  Hiv? hiv;
  Musculoskeletal? musculoskeletal;
  Psychological? psychological;

  MedicalInformation4(
      {this.dermatology, this.hiv, this.musculoskeletal, this.psychological});

  MedicalInformation4.fromJson(Map<String, dynamic> json) {
    dermatology = json['dermatology'] != null
        ? new Dermatology.fromJson(json['dermatology'])
        : null;
    hiv = json['hiv'] != null ? new Hiv.fromJson(json['hiv']) : null;
    musculoskeletal = json['musculoskeletal'] != null
        ? new Musculoskeletal.fromJson(json['musculoskeletal'])
        : null;
    psychological = json['psychological'] != null
        ? new Psychological.fromJson(json['psychological'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dermatology != null) {
      data['dermatology'] = this.dermatology!.toJson();
    }
    if (this.hiv != null) {
      data['hiv'] = this.hiv!.toJson();
    }
    if (this.musculoskeletal != null) {
      data['musculoskeletal'] = this.musculoskeletal!.toJson();
    }
    if (this.psychological != null) {
      data['psychological'] = this.psychological!.toJson();
    }
    return data;
  }
}

class Dermatology {
  bool? dermatologist;
  String? dermatologistNumber;
  bool? skinDisorder;
  String? whatKind;

  Dermatology(
      {this.dermatologist,
      this.dermatologistNumber,
      this.skinDisorder,
      this.whatKind});

  Dermatology.fromJson(Map<String, dynamic> json) {
    dermatologist = json['dermatologist'];
    dermatologistNumber = json['dermatologist_number'];
    skinDisorder = json['skin_disorder'];
    whatKind = json['what_kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dermatologist'] = this.dermatologist;
    data['dermatologist_number'] = this.dermatologistNumber;
    data['skin_disorder'] = this.skinDisorder;
    data['what_kind'] = this.whatKind;
    return data;
  }
}

class Hiv {
  bool? doctor;
  String? doctorNumber;
  String? lengthOfTime;
  bool? positive;
  bool? viralLoadUndetectable;

  Hiv(
      {this.doctor,
      this.doctorNumber,
      this.lengthOfTime,
      this.positive,
      this.viralLoadUndetectable});

  Hiv.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'];
    doctorNumber = json['doctor_number'];
    lengthOfTime = json['length_of_time'];
    positive = json['positive'];
    viralLoadUndetectable = json['viral_load_undetectable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor'] = this.doctor;
    data['doctor_number'] = this.doctorNumber;
    data['length_of_time'] = this.lengthOfTime;
    data['positive'] = this.positive;
    data['viral_load_undetectable'] = this.viralLoadUndetectable;
    return data;
  }
}

class Musculoskeletal {
  bool? arthritis;
  bool? brokenBones;
  bool? jointPain;
  bool? jointSwing;
  bool? osteoporosis;

  Musculoskeletal(
      {this.arthritis,
      this.brokenBones,
      this.jointPain,
      this.jointSwing,
      this.osteoporosis});

  Musculoskeletal.fromJson(Map<String, dynamic> json) {
    arthritis = json['arthritis'];
    brokenBones = json['broken_bones'];
    jointPain = json['joint_pain'];
    jointSwing = json['joint_swing'];
    osteoporosis = json['osteoporosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arthritis'] = this.arthritis;
    data['broken_bones'] = this.brokenBones;
    data['joint_pain'] = this.jointPain;
    data['joint_swing'] = this.jointSwing;
    data['osteoporosis'] = this.osteoporosis;
    return data;
  }
}

class Psychological {
  bool? alchoholeSubstanceAbuse;
  bool? anxiety;
  bool? depression;
  bool? historyOfMentalIllness;
  String? psychiatrist;
  String? psychiatristNumber;

  Psychological(
      {this.alchoholeSubstanceAbuse,
      this.anxiety,
      this.depression,
      this.historyOfMentalIllness,
      this.psychiatrist,
      this.psychiatristNumber});

  Psychological.fromJson(Map<String, dynamic> json) {
    alchoholeSubstanceAbuse = json['alchohole_substance_abuse'];
    anxiety = json['anxiety'];
    depression = json['depression'];
    historyOfMentalIllness = json['history_of_mental_illness'];
    psychiatrist = json['psychiatrist'];
    psychiatristNumber = json['psychiatrist_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alchohole_substance_abuse'] = this.alchoholeSubstanceAbuse;
    data['anxiety'] = this.anxiety;
    data['depression'] = this.depression;
    data['history_of_mental_illness'] = this.historyOfMentalIllness;
    data['psychiatrist'] = this.psychiatrist;
    data['psychiatrist_number'] = this.psychiatristNumber;
    return data;
  }
}

class MedicareMedicaidInfo {
  String? medicaidId;
  String? medicareId;

  MedicareMedicaidInfo({this.medicaidId, this.medicareId});

  MedicareMedicaidInfo.fromJson(Map<String, dynamic> json) {
    medicaidId = json['medicaid_id'];
    medicareId = json['medicare_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicaid_id'] = this.medicaidId;
    data['medicare_id'] = this.medicareId;
    return data;
  }
}

class PatientInfo {
  Address? address;
  String? cell;
  String? considerFor;
  String? dob;
  String? email;
  String? emergencyContact;
  String? emergencyName;
  String? gender;
  String? languagePreference;
  String? maritalStatus;
  String? name;
  String? phoneNumber;
  String? race;
  String? socialSecurity;
  bool? speakEnglish;
  bool? usCitizen;
  bool? usResident;

  PatientInfo(
      {this.address,
      this.cell,
      this.considerFor,
      this.dob,
      this.email,
      this.emergencyContact,
      this.emergencyName,
      this.gender,
      this.languagePreference,
      this.maritalStatus,
      this.name,
      this.phoneNumber,
      this.race,
      this.socialSecurity,
      this.speakEnglish,
      this.usCitizen,
      this.usResident});

  PatientInfo.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    cell = json['cell'];
    considerFor = json['consider_for'];
    dob = json['dob'];
    email = json['email'];
    emergencyContact = json['emergency_contact'];
    emergencyName = json['emergency_name'];
    gender = json['gender'];
    languagePreference = json['language_preference'];
    maritalStatus = json['marital_status'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    race = json['race'];
    socialSecurity = json['social_security'];
    speakEnglish = json['speak_english'];
    usCitizen = json['us_citizen'];
    usResident = json['us_resident'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['cell'] = this.cell;
    data['consider_for'] = this.considerFor;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['emergency_contact'] = this.emergencyContact;
    data['emergency_name'] = this.emergencyName;
    data['gender'] = this.gender;
    data['language_preference'] = this.languagePreference;
    data['marital_status'] = this.maritalStatus;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['race'] = this.race;
    data['social_security'] = this.socialSecurity;
    data['speak_english'] = this.speakEnglish;
    data['us_citizen'] = this.usCitizen;
    data['us_resident'] = this.usResident;
    return data;
  }
}

class Address {
  String? city;
  String? state;
  int? zip;

  Address({this.city, this.state, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class ReferringPhysician {
  CoordinatorInfo? coordinatorInfo;
  Listing? listing;
  CoordinatorInfo? nephrologistDialysisKidneyDoctor;
  Physician? physician;
  CoordinatorInfo? primaryCareDoctor;
  bool? waitingListAtAnotherCenter;

  ReferringPhysician(
      {this.coordinatorInfo,
      this.listing,
      this.nephrologistDialysisKidneyDoctor,
      this.physician,
      this.primaryCareDoctor,
      this.waitingListAtAnotherCenter});

  ReferringPhysician.fromJson(Map<String, dynamic> json) {
    coordinatorInfo = json['coordinator_info'] != null
        ? new CoordinatorInfo.fromJson(json['coordinator_info'])
        : null;
    listing =
        json['listing'] != null ? new Listing.fromJson(json['listing']) : null;
    nephrologistDialysisKidneyDoctor =
        json['nephrologist_dialysis_kidney_doctor'] != null
            ? new CoordinatorInfo.fromJson(
                json['nephrologist_dialysis_kidney_doctor'])
            : null;
    physician = json['physician'] != null
        ? new Physician.fromJson(json['physician'])
        : null;
    primaryCareDoctor = json['primary_care_doctor'] != null
        ? new CoordinatorInfo.fromJson(json['primary_care_doctor'])
        : null;
    waitingListAtAnotherCenter = json['waiting_list_at_another_center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinatorInfo != null) {
      data['coordinator_info'] = this.coordinatorInfo!.toJson();
    }
    if (this.listing != null) {
      data['listing'] = this.listing!.toJson();
    }
    if (this.nephrologistDialysisKidneyDoctor != null) {
      data['nephrologist_dialysis_kidney_doctor'] =
          this.nephrologistDialysisKidneyDoctor!.toJson();
    }
    if (this.physician != null) {
      data['physician'] = this.physician!.toJson();
    }
    if (this.primaryCareDoctor != null) {
      data['primary_care_doctor'] = this.primaryCareDoctor!.toJson();
    }
    data['waiting_list_at_another_center'] = this.waitingListAtAnotherCenter;
    return data;
  }
}

class CoordinatorInfo {
  String? name;
  String? phoneNumber;

  CoordinatorInfo({this.name, this.phoneNumber});

  CoordinatorInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Listing {
  String? when;
  String? where;

  Listing({this.when, this.where});

  Listing.fromJson(Map<String, dynamic> json) {
    when = json['when'];
    where = json['where'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['when'] = this.when;
    data['where'] = this.where;
    return data;
  }
}

class Physician {
  String? address;
  String? city;
  String? name;
  String? phoneNumber;
  String? state;
  String? zip;

  Physician(
      {this.address,
      this.city,
      this.name,
      this.phoneNumber,
      this.state,
      this.zip});

  Physician.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class SpecialConcerns {
  String? helpWthConcern;
  String? regardingTransplant;

  SpecialConcerns({this.helpWthConcern, this.regardingTransplant});

  SpecialConcerns.fromJson(Map<String, dynamic> json) {
    helpWthConcern = json['help_wth_concern'];
    regardingTransplant = json['regarding_transplant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['help_wth_concern'] = this.helpWthConcern;
    data['regarding_transplant'] = this.regardingTransplant;
    return data;
  }
}
