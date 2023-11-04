class Doctor
{
  int id,exp,age;
  String name,spec;
  Doctor({
  this.id=-1,
    required this.name,
    required this.exp,
    required this.age,
    required this.spec
  });
  Map<String,dynamic> toMap()
  {
    return <String,dynamic>{
      "name":name,
      "age":age,
      "spec":spec,
      "experience":exp

    };

  }
}