import 'package:blemulator_example/scan/scan_result_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';

class ScanResult extends Equatable {
  final String name;
  final String identifier;
  final PeripheralCategory category;
  final int rssi;
  final int mtu;
  final bool isConnectable;
  final AdvertisementData advertisementData;

  ScanResult(this.name, this.identifier, this.category, this.rssi, this.mtu,
      this.isConnectable, this.advertisementData);

  ScanResultViewModel viewModel() {
    return ScanResultViewModel(
      name ?? advertisementData.localName ?? 'Unknown',
      identifier,
      PeripheralCategoryViewModel.fromCategory(category),
      RssiViewModel.fromRssi(rssi),
    );
  }

  @override
  List<Object> get props => [name, identifier, rssi, mtu, isConnectable];
}

enum PeripheralCategory { sensorTag, other }