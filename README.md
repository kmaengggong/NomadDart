# NomadDart

## 1. Variables
### 1-1. var
```
var name = "Nina";
name = 17;  // error
```
- 아무거나 들어감. 대신 **초기화**할 때 값을 할당하면 그 값의 타입으로 고정.
- var: `함수`, `메소드` 내부에 지역 변수를 선언할 때.
- 타입(int, String, bool, ...): `class`에서 property를 선언할 때.

### 1-2. dynamic
```
var name;  // or dynamic name;
name = "Momoka";
name = 20;  // no error
```
- 여러가지 타입 사용 가능. 잘 안 씀.
- 기본적으로 var 타입에 값을 할당 안하면 dynamic 타입임.
- dynamic으로 선언된 변수를 사용하려면 타입을 확인해야 됨.
    - `if(name is String) ~`

### 1-3. nullable
```
String? name = "Subaru";
name = null;  // no error: null safety
name.length;  // error

if(name != null){
    name.isNotEmpty;  // no error
}

name?.isNotEmpty;  // no error
```
- ?

### 1-4. final
```
final String name = "Tomo";
name = "Rupa";  // error

final String name1;
name1 = "Rupa";  // no error
```
- 자바스크립트의 const와 비슷

### 1-5. late
```
late final String name;

// ~~

print(name);  // error
name = "Togetoge";

```
- 먼저 변수를 선언하고 나중에 값 할당.
- class에서 final 변수 받을 때 사용.

### 1-6. const
```
const pi = 3.141592;
pi = 3.14;  // error

const pii;  // error
pii = 3.141592;  // error
```
- 컴파일 시에 들어감.
- final과 비교
    - 둘 다 한 번 할당되면 변경 불가.
    - final은 런타임 시 들어가기 때문에 추후에 할당 가능.
    - const는 컴파일 시 들어가기 때문에 선언할 때 값을 할당해야 함.

## 2. Data Types
### 2-1. Basic
- `String`, `int`, `double`, `bool`, `num`
- 전부 클래스.
- int, double은 num을 상속받음.

### 2-2. Lists
```
List<String> members = ["Nina", "Momoka", "Subaru", "Tomo", "Rupa"];
var members1 = ["Nina", "Momoka", "Subaru", "Tomo", "Rupa"];  // 위의 코드와 같음
```
- var 쓰면 자동으로 인식함.

```
var isBeniShoga = true;
var members = [
    "Nina",
    "Momoka",
    "Subaru",
    if(isBeniShoga) "Tomo", "Rupa"
];
```
- Collection if

```
var shinKawasaki = ["Nina", "Momoka", "Subaru"];
var togetoge = [
    for(var member in shinKawasaki) "⛩$member",
    "🍚Tomo", "🍚Rupa"
];
```
- Collection for

### 2-3. String
```
var familyName = "Iseri";
var fullName = "Nina $familyName";  // ${familyName} 도 가능

var age = 17;
var introduce = "Hi, I'm ${age + 1} years old.";  // $age + 1는 불가
```
- 단순히 변수 참조 시 {} 생략 가능.

### 2-4. Maps
```
Map<String, String> nina1 = {
    'name': 'Nina',
    'age': '17',
    'guitar': 'hetakuso'
};

var nina = {
    'name': 'Nina',
    'age': 17,
    'guitar': false
};  // Map<String, Object> 와 같음.
```
- JavaScript의 Object, Python의 Dictinoary와 비슷.

### 2-5. Sets
```
Set<String> members = {"Nina", "Momoka", "Subaru", "Tomo", "Rupa"};
var members1 = {"Nina", "Momoka", "Subaru", "Tomo", "Rupa"};  // 위의 코드와 같음
```
- 다른 언어의 Set과 같이 중복값 허용안함.

## 3. Functions
### 3-1. Defining a function(Positional Parameters)
```
void sayHello(String name) {
    print("Hey $name, your guitar is hetakuso");
}

// fat arrow syntax
void sayHello1(String name) => print("Hey $name, your guitar is hetakuso");
```
- `리턴값 함수명(파라미터)`

### 3-2. Named Parameters
```
String sayHello({
    required String name,
    int time = 100
}) {
    return "Hey $name, your guitar would be hetakuso even $time years later";
}

void main() {
    print(sayHello(
        name: "Nina"
    ));
}
```
- 함수 파라미터 선언에 중괄호 {}을 붙이고
- null값 때문에 앞에 required를 붙여서 무조건 받게 하거나,
- 혹은 기본값을 선언해주면 해당 파라미터를 안 받아도 됨.

### 3-3. Optional Positional Parameters
```
String sayHello(String name, [int? time = 100]) => "Hey $name, your guitar would be hetakuso even $time years later";
```
- Named Parameters를 사용하지 않고 Positional Parameters를 사용하고 싶을 때, 파라미터를 안 받아도 되는 방법.
- 대괄호 [] 붙이고 타입에 ?. 그리고 기본값 할당. 왤케 복잡해.

### 3-4. QQ Operator
```
String getStrongName(String? name){
    if(name != null){
        return name.toUpperCase();
    }
    return "Nameless Name";
}
```
- 이 방법 대신에,

```
String getStrongName(String? name) => name != null ? name.toUpperCase() : "Nameless Name";
```
- 이 방법 대신에,

```
String getStrongName(String? name) => name?.toUpperCase() ?? "Nameless Name";
```
- 좌항이 null이 아니면 좌항을 리턴, 좌항이 null이면 우항을 리턴.

```
String? name;
name ??= "Momoka";  // null이기 때문에 할당
name ??= "Diamond Dust";  // null이 아니기 때문에 할당 x
```
- QQ equals || QQ assignment operator

### 3-5. Typedef
```
typedef Togetoge = List<String>;
```
- alias.
- List\<String> 쓸 자리에 typedef로 선언한 타입 사용 가능.
- 간단한 자료형만 사용 가능. -> 왜 필요한거야.

## 4. Classes
### 4-1. Defining a class
```
class Toge {
    final String name = "Nina";
    int age = 17;

    void sayHello() {
        print("$name: Watashitachiwa eto.. Togenashi Togeari desu!");
    }
}

void main() {
    var toge = Toge();
    print(toge.name);
    toge.age = 18;  // no error
    toge.name = "Momoka";  // error
}
```
- 인스턴스 생성 시 new 키워드 안 붙혀도 됨.
- class method 내에서 웬만해선 this 키워드 사용 x.

### 4-2. Constructors
```
class Toge {
    final String name;  // error
    -> late final String name;
    int age;  // error
    -> late int age;

    Toge(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```
- 이 방법 대신에,

```
class Toge {
    final String name;
    int age;

    Toge(this.name, this.age);
}
```
- 훨씬 간결함. 대신에 이것도 positional parameter임.

### 4-3. Named Constructor Parameters
```
class Toge {
    final String name;
    int age, xp;
    String position;

    Toge({
        required this.name,
        required this.age,
        this.xp = 0,
        required this.position
    });
}
```
- 마찬가지로 기본값을 주거나, required를 붙이거나.

### 4-4. Named Constructor
```
class Toge {
    // 위와 동일

    Toge.createTogenashi({
        required String name,
        required int age
    }): this.name = name,
        this.age = age,
        this.xp = 100,
        this.position = "Togenashi";

    Toge.createTogeari(String name, int age):
        this.name = name,
        this.age = age,
        this.xp = 0,
        this.position = "Togeari";
}
```
- 생성자 선언의 다른 방식.
- 콜론 : 을 붙여야하는 것과, : 이후에 세미콜론 ;이 아니라 콤마 ,로 구분하고 마지막에 세미콜론 ;임을 유의.
- API에서 데이터 가져와서 인스턴스로 변환할 때 유용.
    ```
    Toge.fromJson(Map<String, dynamic> json):
        name = json['name'],
        age = json['age'],
        xp = json['xp'],
        position = json['position'];
    ```
    - 이런식으로.

### 4-5. Casacde Notation
```
var nina = Toge(name: "Nina", age: 17, position: "Vocal");
nina.name = "Iseri";  // error: final
nina.age = 18;
nina.position = "Guitar";

// 위와 같은 코드
var nina1 = Toge(name: "Nina", age: 17, position: "Vocal")
..age = 18
..position = "Guitar";
```
- 앞에 클래스, 인스턴스가 있으면 .. 이 그것을 가리킴.
- 세미콜론 ; 이 없어야됨에 유의.

### 4-6. Enums
```
enum Band {Vocal, Guitar, Bass, Drum, Piano}

...

var nina = Toge(name: "Nina", age: 17, position: Band.Vocal);
```
- 개발자의 실수를 줄여줌.
- 예를 들어, position: Giutar라고 줄 수 있으나, enum 사용하면 Band. 에서 선택지가 나뉨.

### 4-7. Abstract Classes
```
abstract class Band {
    void perform(String stage);
    void resign(String name);
}

class Toge extends Band {
    void perform(String stage) {
        print("Perform at $stage");
    }

    void resign(String name) {
        print("$name yameru Bando");
    }
}
```
- 다른 언어랑 같음.

### 4-8. Inheritance
```
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
```
- 다른 언어의 상속과 비슷. super 사용에 유의.


### 4-9. Mixins
```
```
- 