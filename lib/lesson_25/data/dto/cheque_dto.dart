import 'package:json_annotation/json_annotation.dart';

part 'cheque_dto.g.dart';

@JsonSerializable(createToJson: false)
class ChequeDto {
  ChequeDto({
    required this.chequeHeader,
    required this.sumDiscount,
    required this.chequeLines,
    required this.chequeActions,
    required this.chPrediction,
    required this.sumCashback,
    required this.chequeMagicName,
    required this.feedbackRates,
  });

  final ChequeHeader? chequeHeader;
  final double? sumDiscount;
  final List<ChequeLine>? chequeLines;
  final List<ChequeAction>? chequeActions;
  final String? chPrediction;
  final int? sumCashback;
  final String? chequeMagicName;
  final List<dynamic>? feedbackRates;

  factory ChequeDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChequeAction {
  ChequeAction({
    required this.actionType,
    required this.actionTypeCodeName,
    required this.actionId,
    required this.discpercent,
    required this.discount,
    required this.varcharData,
  });

  final int? actionType;
  final String? actionTypeCodeName;
  final int? actionId;
  final int? discpercent;
  final double? discount;
  final String? varcharData;

  factory ChequeAction.fromJson(Map<String, dynamic> json) =>
      _$ChequeActionFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChequeHeader {
  ChequeHeader({
    required this.filId,
    required this.chequeId,
    required this.created,
    required this.loyaltyFactId,
    required this.businessCardId,
    required this.sumReg,
    required this.sumBalance,
    required this.filialName,
    required this.cityName,
    required this.frId,
    required this.zId,
    required this.frChequeId,
    required this.payType,
    required this.payTypeArray,
    required this.fiscalNumber,
    required this.externalOperationId,
  });

  final int? filId;
  final int? chequeId;
  final DateTime? created;
  final int? loyaltyFactId;
  final int? businessCardId;
  final double? sumReg;
  final double? sumBalance;
  final String? filialName;
  final String? cityName;
  final int? frId;
  final int? zId;
  final int? frChequeId;
  final int? payType;
  final List<dynamic>? payTypeArray;
  final String? fiscalNumber;
  final dynamic externalOperationId;

  factory ChequeHeader.fromJson(Map<String, dynamic> json) =>
      _$ChequeHeaderFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChequeLine {
  ChequeLine({
    required this.chequeLineId,
    required this.lagerId,
    required this.lagerNameUa,
    required this.lagerUnit,
    required this.kolvo,
    required this.priceOut,
    required this.unitText,
    required this.fileName,
    required this.sumCashbackLine,
    required this.additionalData,
    required this.like,
  });

  final int? chequeLineId;
  final int? lagerId;

  @JsonKey(name: 'lagerNameUA')
  final String? lagerNameUa;
  final String? lagerUnit;
  final double? kolvo;
  final double? priceOut;
  final String? unitText;
  final String? fileName;
  final int? sumCashbackLine;
  final AdditionalData? additionalData;
  final Like? like;

  factory ChequeLine.fromJson(Map<String, dynamic> json) =>
      _$ChequeLineFromJson(json);
}

@JsonSerializable(createToJson: false)
class AdditionalData {
  AdditionalData({
    required this.id,
    required this.title,
    required this.icon,
    required this.ratio,
    required this.sectionSlug,
    required this.companyId,
    required this.externalProductId,
    required this.slug,
    required this.classifierSapId,
    required this.brandId,
    required this.brandTitle,
    required this.weighted,
    required this.departmentName,
    required this.barcodes,
    required this.weight,
    required this.scanExcise,
  });

  final String? id;
  final String? title;
  final String? icon;
  final String? ratio;
  final String? sectionSlug;
  final String? companyId;
  final String? externalProductId;
  final String? slug;
  final String? classifierSapId;
  final String? brandId;
  final String? brandTitle;
  final bool? weighted;
  final String? departmentName;
  final List<String>? barcodes;
  final double? weight;
  final bool? scanExcise;

  factory AdditionalData.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class Like {
  Like({required this.contains});

  final bool? contains;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
