public enum LexicalUnit{
    BEGINPROG, //MMM OK
    PROGNAME,  //TGL OK 
    ENDLINE,  //MMM  OK
    ENDPROG, //MMM   OK
    COMMA,   //TGL   OK
    VARNAME, //TGL   OK
    ASSIGN,  //TGL   OK
    NUMBER,  //TGL   OK
    LPAREN, //MMM    OK  Afficher variables a la fin des .output?
    RPAREN, //MMM    OK
    MINUS, //MMM     OK
    PLUS, //MMM      OK
    TIMES, //MMM     OK
    DIVIDE, //MMM    OK
    IF, //TGL        OK
    THEN, //TGL      OK
    ENDIF, //TGL     OK
    ELSE, //TGL      OK
    EQ, //TGL        OK
    GT, //TGL        OK
    WHILE, //TGL     OK
    DO, //TGL        OK
    ENDWHILE, //TGL  OK
    PRINT, //MMM     OK
    READ, //MMM      OK
    EOS  //MMM
}
