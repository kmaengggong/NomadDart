class Player {
    final String name;
    int xp;
    String team;
    
    Player({required this.name, required this.xp, required this.team});

    void sayHello() {
        print("Hi my name is $name");
    }
}

class Band {
    final String name;
    Band({required this.name});
    void introduce() {
        print("We're $name");
    }
}

class Toge extends Band {
    final List<String> members;
    Toge({
        required String name,
        required this.members
    }): super(name: name);
    @override
    void introduce(){
        super.introduce();
        print("Members: $members");
    }
}

void main() {
}