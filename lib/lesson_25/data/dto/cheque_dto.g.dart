// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeDto _$ChequeDtoFromJson(Map<String, dynamic> json) => ChequeDto(
  chequeHeader: json['chequeHeader'] == null
      ? null
      : ChequeHeader.fromJson(json['chequeHeader'] as Map<String, dynamic>),
  sumDiscount: (json['sumDiscount'] as num?)?.toDouble(),
  chequeLines: (json['chequeLines'] as List<dynamic>?)
      ?.map((e) => ChequeLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  chequeActions: (json['chequeActions'] as List<dynamic>?)
      ?.map((e) => ChequeAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  chPrediction: json['chPrediction'] as String?,
  sumCashback: (json['sumCashback'] as num?)?.toInt(),
  chequeMagicName: json['chequeMagicName'] as String?,
  feedbackRates: json['feedbackRates'] as List<dynamic>?,
);

ChequeAction _$ChequeActionFromJson(Map<String, dynamic> json) => ChequeAction(
  actionType: (json['actionType'] as num?)?.toInt(),
  actionTypeCodeName: json['actionTypeCodeName'] as String?,
  actionId: (json['actionId'] as num?)?.toInt(),
  discpercent: (json['discpercent'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toDouble(),
  varcharData: json['varcharData'] as String?,
);

ChequeHeader _$ChequeHeaderFromJson(Map<String, dynamic> json) => ChequeHeader(
  filId: (json['filId'] as num?)?.toInt(),
  chequeId: (json['chequeId'] as num?)?.toInt(),
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  loyaltyFactId: (json['loyaltyFactId'] as num?)?.toInt(),
  businessCardId: (json['businessCardId'] as num?)?.toInt(),
  sumReg: (json['sumReg'] as num?)?.toDouble(),
  sumBalance: (json['sumBalance'] as num?)?.toDouble(),
  filialName: json['filialName'] as String?,
  cityName: json['cityName'] as String?,
  frId: (json['frId'] as num?)?.toInt(),
  zId: (json['zId'] as num?)?.toInt(),
  frChequeId: (json['frChequeId'] as num?)?.toInt(),
  payType: (json['payType'] as num?)?.toInt(),
  payTypeArray: json['payTypeArray'] as List<dynamic>?,
  fiscalNumber: json['fiscalNumber'] as String?,
  externalOperationId: json['externalOperationId'],
);

ChequeLine _$ChequeLineFromJson(Map<String, dynamic> json) => ChequeLine(
  chequeLineId: (json['chequeLineId'] as num?)?.toInt(),
  lagerId: (json['lagerId'] as num?)?.toInt(),
  lagerNameUa: json['lagerNameUA'] as String?,
  lagerUnit: json['lagerUnit'] as String?,
  kolvo: (json['kolvo'] as num?)?.toDouble(),
  priceOut: (json['priceOut'] as num?)?.toDouble(),
  unitText: json['unitText'] as String?,
  fileName: json['fileName'] as String?,
  sumCashbackLine: (json['sumCashbackLine'] as num?)?.toInt(),
  additionalData: json['additionalData'] == null
      ? null
      : AdditionalData.fromJson(json['additionalData'] as Map<String, dynamic>),
  like: json['like'] == null
      ? null
      : Like.fromJson(json['like'] as Map<String, dynamic>),
);

AdditionalData _$AdditionalDataFromJson(Map<String, dynamic> json) =>
    AdditionalData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      ratio: json['ratio'] as String?,
      sectionSlug: json['sectionSlug'] as String?,
      companyId: json['companyId'] as String?,
      externalProductId: json['externalProductId'] as String?,
      slug: json['slug'] as String?,
      classifierSapId: json['classifierSapId'] as String?,
      brandId: json['brandId'] as String?,
      brandTitle: json['brandTitle'] as String?,
      weighted: json['weighted'] as bool?,
      departmentName: json['departmentName'] as String?,
      barcodes: (json['barcodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weight: (json['weight'] as num?)?.toDouble(),
      scanExcise: json['scanExcise'] as bool?,
    );

Like _$LikeFromJson(Map<String, dynamic> json) =>
    Like(contains: json['contains'] as bool?);
