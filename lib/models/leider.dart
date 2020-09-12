class Leider {
  String name;
  String cellphone;
  String email;

  Leider(String name, String cellphone) {
    this.name = name;
    this.cellphone = cellphone;
//    Remove all spaces
    this.email = name.replaceAll(new RegExp(r"\s+"), "") + '@kramaai.be';
  }
}
