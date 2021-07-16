

class ContactModel {
  
    String name;
    String number;

    ContactModel({
     
        required this.name,
        required this.number,
    });

  

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        
        name: json["name"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
    
        "name": name,
        "number": number,
    };
}