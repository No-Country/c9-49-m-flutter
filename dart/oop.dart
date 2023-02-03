void main() {
  //Creating classes
  //Person p1 = Person(name, sex, age)
  Person p1 = Person("Pedro", "Male", 50);
  p1.showData();
  //Person p2 = Person(name, sex, age)
  Person2 p2 = Person2();
  p2.showData(); //--> Name= null Sex= null Age= null
  //Add data
  p2.sex = "Male";
  p2.age = 45;
  p2.name = "Peter";
  p2.showData(); //--> Name= Peter Sex= Male Age= 45

  //p2.addData("Mary", "Female", 35); //--> Name= Mary, Sex= Female, Age= 35
}

class Person {
  String? name, sex;
  int? age;

  //Constructor
  Person(String name, sex, int age) {
    this.name = name;
    this.sex = sex;
    this.age = age;
  }

  //Method
  void showData() {
    print("Name= ${name}");
    print("Sex= ${sex}");
    print("Age= ${age}");
  }
}

class Person2 {
  String? name, sex;
  int? age;

  //Method
  void addData(String name, sex, int age) {
    this.name = name;
    this.sex = sex;
    this.age = age;
  }

  //Method
  void showData() {
    print("Name= ${name}");
    print("Sex= ${sex}");
    print("Age= ${age}");
  }
}
