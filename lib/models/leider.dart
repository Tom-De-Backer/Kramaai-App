
class Leider {
  String name;
  String cellphone;
  String email;
  String group;

  Leider(String name, String cellphone) {
    this.name = name;
    this.cellphone = cellphone;
//    Remove all spaces
    this.email = name.replaceAll(new RegExp(r"\s+"), "") + '@kramaai.be';
  }


  Leider.fromMap(Map<String, dynamic> data) {
    name = data['Naam'];
    cellphone = data['Telefoon'];
    group = data['Groep'];
    email = name.replaceAll(new RegExp(r"\s+"), "") + '@kramaai.be';
  }
}
