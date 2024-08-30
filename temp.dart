// Type definitions for better readability and reusability
typedef Word = String;
typedef Definition = String;
typedef WordDefinitionMap = Map<Word, Definition>;
typedef BulkAddList = List<Map<String, String>>;
typedef BulkDeleteList = List<Word>;

class Dictionary {
  // Private WordDefinitionMap to store words and their definitions
  final WordDefinitionMap _words = {};

  // Method to add a word to the dictionary
  void add(Word term, Definition definition) {
    if (_words.containsKey(term)) {
      print("The word '$term' already exists.");
    } else {
      _words[term] = definition;
      print("The word '$term' has been added.");
    }
  }

  // Method to get the definition of a word
  Definition? get(Word term) {
    return _words[term];
  }

  // Method to delete a word from the dictionary
  void delete(Word term) {
    if (_words.containsKey(term)) {
      _words.remove(term);
      print("The word '$term' has been deleted.");
    } else {
      print("The word '$term' does not exist.");
    }
  }

  // Method to update the definition of a word
  void update(Word term, Definition definition) {
    if (_words.containsKey(term)) {
      _words[term] = definition;
      print("The word '$term' has been updated.");
    } else {
      print("The word '$term' does not exist.");
    }
  }

  // Method to show all words in the dictionary
  void showAll() {
    if (_words.isEmpty) {
      print("The dictionary is empty.");
    } else {
      _words.forEach((term, definition) {
        print("Word: $term, Definition: $definition");
      });
    }
  }

  // Method to count the total number of words in the dictionary
  int count() {
    return _words.length;
  }

  // Method to update if exists, or insert a word if it doesn't exist (upsert)
  void upsert(Word term, Definition definition) {
    if (_words.containsKey(term)) {
      print("The word '$term' exists. Updating its definition.");
    } else {
      print("The word '$term' does not exist. Adding it to the dictionary.");
    }
    _words[term] = definition;
  }

  // Method to check if a word exists in the dictionary
  bool exists(Word term) {
    return _words.containsKey(term);
  }

  // Method to add multiple words to the dictionary
  void bulkAdd(BulkAddList terms) {
    for (var entry in terms) {
      final term = entry["term"];
      final definition = entry["definition"];
      if (term != null && definition != null) {
        add(term, definition);
      }
    }
  }

  // Method to delete multiple words from the dictionary
  void bulkDelete(BulkDeleteList terms) {
    for (var term in terms) {
      delete(term);
    }
  }
}

void main() {
  // Example usage of the Dictionary class
  Dictionary dictionary = Dictionary();

  dictionary.add("김치", "대박이네~");
  dictionary.add("아파트", "비싸네~");
  print(dictionary.get("김치")); // Output: 대박이네~
  dictionary.update("김치", "매운맛");
  dictionary.showAll();
  print("Total words: ${dictionary.count()}"); // Output: 2

  dictionary.upsert("아파트", "엄청 비싸네~");
  dictionary.upsert("집", "편안하네~");

  dictionary.bulkAdd([
    {"term": "학교", "definition": "공부하는 곳"},
    {"term": "회사", "definition": "일하는 곳"}
  ]);

  dictionary.showAll();

  dictionary.bulkDelete(["김치", "학교"]);
  dictionary.showAll();
}