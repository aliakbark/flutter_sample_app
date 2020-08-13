// To parse this JSON data, do
//
//     final flatsResponse = flatsResponseFromJson(jsonString);

import 'dart:convert';

FlatsResponse flatsResponseFromJson(String str) =>
    FlatsResponse.fromJson(json.decode(str));

String flatsResponseToJson(FlatsResponse data) => json.encode(data.toJson());

class FlatsResponse {
  FlatsResponse({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory FlatsResponse.fromJson(Map<String, dynamic> json) => FlatsResponse(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.isActive,
    this.title,
    this.nickName,
    this.houseNo,
    this.buildingName,
    this.streetName,
    this.landmark,
    this.pinCode,
    this.district,
    this.state,
    this.country,
    this.propertyType,
    this.noOfBedrooms,
    this.noOfBathrooms,
    this.noOfFlatmates,
    this.roomType,
    this.roomFurnishing,
    this.bathroom,
    this.willAccommodate,
    this.houseRules,
    this.lat,
    this.lon,
    this.monthlyRent,
    this.aboutProperty,
    this.availableFrom,
    this.createdAt,
    this.createdBy,
    this.amenities,
    this.additionalPrices,
    this.photos,
  });

  int id;
  bool isActive;
  String title;
  String nickName;
  String houseNo;
  String buildingName;
  String streetName;
  String landmark;
  String pinCode;
  String district;
  String state;
  String country;
  String propertyType;
  int noOfBedrooms;
  int noOfBathrooms;
  int noOfFlatmates;
  String roomType;
  String roomFurnishing;
  String bathroom;
  String willAccommodate;
  String houseRules;
  String lat;
  String lon;
  int monthlyRent;
  String aboutProperty;
  DateTime availableFrom;
  DateTime createdAt;
  CreatedBy createdBy;
  List<Amenity> amenities;
  List<AdditionalPrice> additionalPrices;
  List<Photo> photos;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        title: json["title"] == null ? null : json["title"],
        nickName: json["nick_name"] == null ? null : json["nick_name"],
        houseNo: json["house_no"] == null ? null : json["house_no"],
        buildingName:
            json["building_name"] == null ? null : json["building_name"],
        streetName: json["street_name"] == null ? null : json["street_name"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        pinCode: json["pin_code"] == null ? null : json["pin_code"],
        district: json["district"] == null ? null : json["district"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        propertyType:
            json["property_type"] == null ? null : json["property_type"],
        noOfBedrooms:
            json["no_of_bedrooms"] == null ? null : json["no_of_bedrooms"],
        noOfBathrooms:
            json["no_of_bathrooms"] == null ? null : json["no_of_bathrooms"],
        noOfFlatmates:
            json["no_of_flatmates"] == null ? null : json["no_of_flatmates"],
        roomType: json["room_type"] == null ? null : json["room_type"],
        roomFurnishing:
            json["room_furnishing"] == null ? null : json["room_furnishing"],
        bathroom: json["bathroom"] == null ? null : json["bathroom"],
        willAccommodate:
            json["will_accommodate"] == null ? null : json["will_accommodate"],
        houseRules: json["house_rules"] == null ? null : json["house_rules"],
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
        monthlyRent: json["monthly_rent"] == null ? null : json["monthly_rent"],
        aboutProperty:
            json["about_property"] == null ? null : json["about_property"],
        availableFrom: json["available_from"] == null
            ? null
            : DateTime.parse(json["available_from"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
        amenities: json["amenities"] == null
            ? null
            : List<Amenity>.from(
                json["amenities"].map((x) => Amenity.fromJson(x))),
        additionalPrices: json["additional_prices"] == null
            ? null
            : List<AdditionalPrice>.from(json["additional_prices"]
                .map((x) => AdditionalPrice.fromJson(x))),
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "is_active": isActive == null ? null : isActive,
        "title": title == null ? null : title,
        "nick_name": nickName == null ? null : nickName,
        "house_no": houseNo == null ? null : houseNo,
        "building_name": buildingName == null ? null : buildingName,
        "street_name": streetName == null ? null : streetName,
        "landmark": landmark == null ? null : landmark,
        "pin_code": pinCode == null ? null : pinCode,
        "district": district == null ? null : district,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "property_type": propertyType == null ? null : propertyType,
        "no_of_bedrooms": noOfBedrooms == null ? null : noOfBedrooms,
        "no_of_bathrooms": noOfBathrooms == null ? null : noOfBathrooms,
        "no_of_flatmates": noOfFlatmates == null ? null : noOfFlatmates,
        "room_type": roomType == null ? null : roomType,
        "room_furnishing": roomFurnishing == null ? null : roomFurnishing,
        "bathroom": bathroom == null ? null : bathroom,
        "will_accommodate": willAccommodate == null ? null : willAccommodate,
        "house_rules": houseRules == null ? null : houseRules,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "monthly_rent": monthlyRent == null ? null : monthlyRent,
        "about_property": aboutProperty == null ? null : aboutProperty,
        "available_from":
            availableFrom == null ? null : availableFrom.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy.toJson(),
        "amenities": amenities == null
            ? null
            : List<dynamic>.from(amenities.map((x) => x.toJson())),
        "additional_prices": additionalPrices == null
            ? null
            : List<dynamic>.from(additionalPrices.map((x) => x.toJson())),
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class AdditionalPrice {
  AdditionalPrice({
    this.id,
    this.billShareItemId,
    this.billShareItemName,
    this.flatId,
  });

  int id;
  int billShareItemId;
  String billShareItemName;
  int flatId;

  factory AdditionalPrice.fromJson(Map<String, dynamic> json) =>
      AdditionalPrice(
        id: json["id"] == null ? null : json["id"],
        billShareItemId: json["bill_share_item_id"] == null
            ? null
            : json["bill_share_item_id"],
        billShareItemName: json["bill_share_item_name"] == null
            ? null
            : json["bill_share_item_name"],
        flatId: json["flat_id"] == null ? null : json["flat_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bill_share_item_id": billShareItemId == null ? null : billShareItemId,
        "bill_share_item_name":
            billShareItemName == null ? null : billShareItemName,
        "flat_id": flatId == null ? null : flatId,
      };
}

class Amenity {
  Amenity({
    this.id,
    this.amenityId,
    this.amenityName,
    this.flatId,
  });

  int id;
  int amenityId;
  String amenityName;
  int flatId;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"] == null ? null : json["id"],
        amenityId: json["amenity_id"] == null ? null : json["amenity_id"],
        amenityName: json["amenity_name"] == null ? null : json["amenity_name"],
        flatId: json["flat_id"] == null ? null : json["flat_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "amenity_id": amenityId == null ? null : amenityId,
        "amenity_name": amenityName == null ? null : amenityName,
        "flat_id": flatId == null ? null : flatId,
      };
}

class CreatedBy {
  CreatedBy({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.userPhoto,
  });

  String userId;
  String email;
  String firstName;
  String lastName;
  String mobileNo;
  String userPhoto;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        userId: json["user_id"] == null ? null : json["user_id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        userPhoto: json["user_photo"] == null ? null : json["user_photo"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "user_photo": userPhoto == null ? null : userPhoto,
      };
}

class Photo {
  Photo({
    this.id,
    this.flat,
    this.path,
    this.tag,
  });

  int id;
  int flat;
  String path;
  String tag;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        flat: json["flat"] == null ? null : json["flat"],
        path: json["path"] == null ? null : json["path"],
        tag: json["tag"] == null ? null : json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "flat": flat == null ? null : flat,
        "path": path == null ? null : path,
        "tag": tag == null ? null : tag,
      };
}
