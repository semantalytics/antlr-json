lexer grammar JsonLexer;

OPEN_CURLY_BRACE
	: '{'
	;

CLOSE_CURLY_BRACE
	: '}'
	;

COMMA
    : ','
    ;

COLON
    : ':'
    ;

OPEN_SQUARE_BRACE
    : '['
    ;

CLOSE_SQUARE_BRACE
    : ']'
    ;

TRUE
    : 'true'
    ;

FALSE
    : 'false'
    ;

NULL
    : 'null'
    ;

STRING
   : '"' (ESC | SAFECODEPOINT)* '"'
   ;

fragment ESC
   : '\\' ( ('"' | '\\' | '/' | 'b' | 'f' | 'n' | 'r' | 't' | UNICODE)
   ;

fragment UNICODE
   : 'u' HEX HEX HEX HEX
   ;

fragment HEX
   : ('0'..'9' | 'a'..'f' | 'A'..'F')
   ;

fragment SAFECODEPOINT
   : ~('"' | '\\' | '\u0000'..'\u001F')
   ;

NUMBER
   : '-'? INT ( DOT ('0'..'9')+ )? EXP?
   ;

fragment INT
   : '0' | ('1'..'9') ('0'..'9')*
   ;

// no leading zeros

fragment EXP
   : ('E' | 'e') ('+' | '\\' | '-')? INT
   ;

WS
   : (' ' | '\t' | '\n' | '\r' )+ -> channel(HIDDEN)
;