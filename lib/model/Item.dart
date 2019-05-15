class Item {
  int id;
  String nom;

  Item();

  fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nom = map['nom'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'nom': this.nom

    };
    if(id != null){
      map['id'] = this.id;
    }
  }
}