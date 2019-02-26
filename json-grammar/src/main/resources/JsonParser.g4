parser grammar JsonParser;

json
   : value
   ;

obj
   : OPEN_CURLY_BRACE (pair (COMMA pair)*)? CLOSE_CURLY_BRACE
   ;

pair
   : STRING COLON value
   ;

array
   : OPEN_BRACE (value (COMMA value)*)? CLOSE_BRACE
   ;

value
   : STRING
   | NUMBER
   | obj
   | array
   | TRUE
   | FALSE
   | NULL
   ;

