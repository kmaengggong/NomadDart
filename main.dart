class Player {
    final String name;
    int xp, age;
    String team;

    Player({
        required this.name,
        required this.xp,
        required this.team,
        required this.age
    });

    Player.createTTPlayer({
        required String name,
        required int age
    }): this.age = age,
        this.name = name,
        this.team = "Togenashi Togeari",
        this.xp = 0;

    Player.createDDPlayer(String name, int age):
        this.age = age,
        this.name = name,
        this.team = "Diamond Dust",
        this.xp = 0;

    void sayHello() {
        print("Hi my name is $name($age) from $team");
    }
}

void main() {
    var player = Player.createTTPlayer(
        name: "Nina",
        age: 17
    );
    var player1 = Player.createDDPlayer("Hina", 17);
    player.sayHello();
    player1.sayHello();
}