class Data{

  static bool loggedIn = false;
  static Map<String, String> user = {
    "username":"",
    "gmail":"",
    "password":""
  };
  static int currentPark = 0;
  static List<Map<String, dynamic>> parkingSites = [
    {
      "parkingName" : "MUBs Parking site",
      "parkingLocation" : "Nakawa port bell Road",
      "availableSlots": 50,
      "pricePerHour": 2,
    },
    {
      "parkingName" : "City Center",
      "parkingLocation":"Kampala",
      "availableSlots": 100,
      "pricePerHour": 4,
    },
    {
      "parkingName": "Ntinda Parking site",
      "parkingLocation":"Ntinda Mall",
      "availableSlots": 23,
      "pricePerHour": 3,
    },
    {
      "parkingName":  "Jokas parking",
      "parkingLocation": "Bweyogerere Namboole",
      "availableSlots": 56,
      "pricePerHour": 6,
    },
    {
      "parkingName": "Makerere Parking site",
      "parkingLocation":"Makerere University",
      "availableSlots": 50,
      "pricePerHour": 1,
    },

    {
      "parkingName": "UICT Nakawa",
      "parkingLocation":"Nakawa Port Bell",
      "availableSlots": 50,
      "pricePerHour": 1,
    },

    
  ];
}