public enum LexicalUnit{
    BEGINPROG, //MMM
    PROGNAME,  //TGL OK 
    ENDLINE,  //MMM
    ENDPROG, //MMM
    COMMA,   //TGL   OK
    VARNAME, //TGL   OK
    ASSIGN,  //TGL   OK
    NUMBER,  //TGL   OK
    LPAREN, //MMM
    RPAREN, //MMM
    MINUS, //MMM
    PLUS, //MMM
    TIMES, //MMM
    DIVIDE, //MMM
    IF, //TGL       OK
    THEN, //TGL     OK
    ENDIF, //TGL    OK
    ELSE, //TGL     OK
    EQ, //TGL       OK
    GT, //TGL       OK
    WHILE, //TGL    OK
    DO, //TGL       OK
    ENDWHILE, //TGL OK
    PRINT, //MMM
    READ, //MMM
    EOS  //MMM
}
