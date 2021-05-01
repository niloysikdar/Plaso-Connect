class DonorModel {
  final String name;
  final String phone;
  final String age;
  final String address;
  final String pin;
  final String bloodGroup;
  final String covidStatus;
  final String dateOfRecovery;
  final String vaccinationStatus;

  DonorModel({
    required this.name,
    required this.phone,
    required this.age,
    required this.address,
    required this.pin,
    required this.bloodGroup,
    required this.covidStatus,
    required this.dateOfRecovery,
    required this.vaccinationStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'age': age,
      'address': address,
      'pin': pin,
      'bloodGroup': bloodGroup,
      'covidStatus': covidStatus,
      'dateOfRecovery': dateOfRecovery,
      'vaccinationStatus': vaccinationStatus,
    };
  }
}
