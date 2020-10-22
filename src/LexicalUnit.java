public enum LexicalUnit{
    BEGINPROG, //MMM
    PROGNAME,  //TGL
    ENDLINE,  //MMM
    ENDPROG, //MMM
    COMMA,   //TGL
    VARNAME, //TGL
    ASSIGN,  //TGL
    NUMBER,  //TGL  not OK
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
    EQ, //TGL       not OK
    GT, //TGL       not OK
    WHILE, //TGL    OK
    DO, //TGL       OK
    ENDWHILE, //TGL OK
    PRINT, //MMM
    READ, //MMM
    EOS  //MMM
}
