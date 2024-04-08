import 'package:amp_up/imports.dart';

// Creating a user model serves several purposes in software development:

// Data Organization: By defining a user model, you create a structured way to represent user data within your application. This makes it easier to work with user data, pass it around between different parts of the application, and manage it consistently.
// Abstraction: A user model abstracts away the details of how user data is stored or retrieved. Regardless of whether user data comes from a database, an API, or local storage, the rest of your application can interact with it through the user model interface.
// Consistency: By using a user model, you ensure that user data is represented consistently throughout your application. This helps prevent errors and confusion that can arise from using different formats or structures for the same data.
// Encapsulation: Encapsulating user data within a user model allows you to enforce constraints and validation rules on that data. For example, you can ensure that certain fields are always present or that they meet certain criteria (e.g., a valid email address).
// Separation of Concerns: By encapsulating user-related functionality within a user model, you promote separation of concerns in your codebase. This makes your code easier to understand, maintain, and test, as each component is responsible for a specific aspect of the application's functionality.

class UserModel extends ChangeNotifier {
  // ChangeNotifier: This is a class provided by the Flutter framework for implementing the Observer pattern. It allows objects to notify their listeners when their state changes. By extending ChangeNotifier, UserModel can notify any listeners (typically UI components) when its internal state changes.
  final int id;
  final String firstName;
  final String lastName;
  final String? middleName;
  final DateTime dob;
  final String balance;
  final String commission;
  final String username;
  final String email;
  final String phone;
  final String? country;
  final String? state;
  final String? localGov;
  final String? address;
  final int status;
  final int isAggregator;
  final String role;
  final String gender;
  final String? image;
  final String deviceModel;
  final String deviceId;
  final DateTime? emailVerifiedAt;
  final DateTime? bvnVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.dob,
    required this.balance,
    required this.commission,
    required this.username,
    required this.email,
    required this.phone,
    this.country,
    this.state,
    this.localGov,
    this.address,
    required this.status,
    required this.isAggregator,
    required this.role,
    required this.gender,
    this.image,
    required this.deviceModel,
    required this.deviceId,
    this.emailVerifiedAt,
    this.bvnVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

// This factory method is a common pattern in Dart/Flutter for converting JSON data into model objects, facilitating data parsing and management within applications.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    //  This map represents the JSON data received from an API or elsewhere.
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      middleName: json['middle_name'],
      dob: DateTime.parse(json['dob'] ?? ''),
      balance: json['balance'] ?? '0.00',
      commission: json['commission'] ?? '0.00',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'],
      state: json['state'],
      localGov: json['local_gov'],
      address: json['address'],
      status: json['status'] ?? 0,
      isAggregator: json['isAggregator'] ?? 0,
      role: json['role'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'],
      deviceModel: json['device_model'] ?? '',
      deviceId: json['device_id'] ?? '',
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      bvnVerifiedAt: json['bvn_verified_at'] != null
          ? DateTime.parse(json['bvn_verified_at'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}
