typedef Words = Map<String, String>;

class Dictionary {
    final Words words = {};

    // add: 단어를 추가함.
    void add(String term, String definition) {
        words[term] = definition;
    }

    // get: 단어의 정의를 리턴함.
    String? get(String term) {
        return words[term];
    }

    // delete: 단어를 삭제함.
    void delete(String term) {
        words.remove(term);
    }

    // update: 단어를 업데이트 함.
    void update(String term, String definition) {
        words[term] = definition;
    }

    // showAll: 사전 단어를 모두 보여줌.
    void showAll() {
        words.forEach((term, definition) {
            print("$term: $definition");
        });
    }

    // count: 사전 단어들의 총 갯수를 리턴함.
    int count() {
        return words.length;
    }

    // upsert 단어를 업데이트 함. 존재하지 않을시. 이를 추가함. (update + insert = upsert)
    void upsert(String term, String definition) {
        words[term] = definition;
    }

    // exists: 해당 단어가 사전에 존재하는지 여부를 알려줌.
    bool exists(String term) {
        if(words.containsKey(term)) return true;
        return false;
    }

    // bulkAdd: 다음과 같은 방식으로. 여러개의 단어를 한번에 추가할 수 있게 해줌. [{"term":"김치", "definition":"대박이네~"}, {"term":"아파트", "definition":"비싸네~"}]
    void bulkAdd(List<Words> newWords) {
        newWords.forEach((word) {
            final term = word["term"];
            final definition = word["definition"];
            if(term != null && definition != null){
                words[term] = definition;
            }
        });
    }

    // bulkDelete: 다음과 같은 방식으로. 여러개의 단어를 한번에 삭제할 수 있게 해줌. ["김치", "아파트"]
    void bulkDelete(List<String> terms) {
        terms.forEach((term) {
            words.remove(term);
        });
    }
}

void main() {
    var dict = Dictionary();
    
    dict.add("Nina", "Vocal");
    dict.showAll();  // Nina: Vocal

    print(dict.get("Nina"));  // Vocal

    dict.delete("Nina");
    dict.showAll();  // no print.
    
    dict.add("Momoka", "Diamond Dust");
    dict.showAll();  // Momoka: Diamond Dust
    dict.update("Momoka", "Togenashi Togeari");
    dict.showAll();  // Momoka: Togenashi Togeari
    
    print(dict.count());  // 1

    dict.upsert("Momoka", "Guitar");
    dict.upsert("Subaru", "Drum");
    dict.showAll();  // Momoka: Guitar\n Subaru: Drum

    print(dict.exists("Subaru"));  // true
    print(dict.exists("Tomo"));  // false
    
    dict.bulkAdd([{"term":"김치", "definition":"대박이네~"}, {"term":"아파트", "definition":"비싸네~"}]);
    dict.showAll();  // Momoka: Guitar\n Subaru: Drum\n김치: 대박이네~\n아파트: 비싸네~

    dict.bulkDelete(["김치", "아파트"]);
    dict.showAll();  // Momoka: Guitar\n Subaru: Drum
}