A = LOAD 'testfiles';
B = FOREACH A GENERATE FLATTEN(TOKENIZE(REPLACE((chararray)$0,'','|'), '|')) AS letter;
C = FILTER B BY letter matches '[^\\s-]';
D = GROUP C BY LOWER(letter);
E = FOREACH D GENERATE group, COUNT(C.letter);
store E into 'alice';
