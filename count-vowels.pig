inputText = load 'testfiles' using PigStorage();
words = foreach inputText generate flatten(TOKENIZE((chararray)$0)) as word;
letters = foreach words generate flatten(TOKENIZE(REPLACE(LOWER(word),'','|'), '|')) as letter;
vowels = FILTER letters BY (letter == 'a' or  letter == 'e' or letter == 'i' or letter == 'o' or letter == 'u' );
groupVowels = group vowels by letter;
finalCount = foreach groupVowels generate group, COUNT(vowels.letter);
store finalCount into 'aliceVowel';
