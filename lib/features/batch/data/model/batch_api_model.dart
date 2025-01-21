import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

@JsonSerializable()
class BatchApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? batchId;
  final String batchName;

  const BatchApiModel({
    this.batchId,
    required this.batchName,
  });

  // Empty constructor for default values
  const BatchApiModel.empty()
      : batchId = '',
        batchName = '';

  // Factory to create a model from JSON
  factory BatchApiModel.fromJson(Map<String, dynamic> json) {
    return BatchApiModel(
      batchId: json['_id'], // Ensure the key matches the API response
      batchName: json['batchName'],
    );
  }

  // Method to convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': batchId, // Ensure the key matches the expected API payload
      'batchName': batchName,
    };
  }

  // Converts this API model to a domain entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  // Factory method to create an API model from a domain entity
  factory BatchApiModel.fromEntity(BatchEntity entity) {
    return BatchApiModel(
      batchId: entity.batchId,
      batchName: entity.batchName,
    );
  }

  // Converts a list of API models to a list of domain entities
  List<BatchEntity> toEntityList(List<BatchApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [batchId, batchName];
}
