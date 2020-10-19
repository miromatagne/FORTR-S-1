%%// Options of the scanner

%class LexicalAnalyzer	//Name
%unicode		//Use unicode
%line         	//Use line counter (yyline variable)
%column       	//Use character counter by line (yycolumn variable)
%type Symbol  //Says that the return type is Symbol
%function nextToken

// Return value of the program
%eofval{
	return new Symbol(LexicalUnit.EOS, yyline, yycolumn);
%eofval}

// Extended Regular Expressions

AlphaUpperCase = [A-Z]
AlphaLowerCase = [a-z]
Alpha          = {AlphaUpperCase}|{AlphaLowerCase}
Numeric        = [0-9]
AlphaNumeric   = {Alpha}|{Numeric}
AlphaLowNumeric= {AlphaLowerCase}|{Numeric}
Space          = "\t"|" "
Any 		   = .
NewLine		   = "\n"		
EndLine	       = "\r"?"\n"

Sign           = [+-]
Integer        = {Sign}?(([1-9][0-9]*)|0)
//Decimal      = \.[0-9]*
//Exponent     = [eE]{Integer}
Number         = {Integer}
VarName        = {AlphaLowerCase}{AlphaLowNumeric}*
ProgName       = {AlphaUpperCase}{AlphaNumeric}*{AlphaLowerCase}{AlphaNumeric}*


 
Comment        = "//"."\n" |"/*"."*/  " 

%%// Identification of tokens

{ProgName}       {return new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn, yytext());}
{VarName}       {return new Symbol(LexicalUnit.VARNAME,yyline, yycolumn, yytext());}
{Number}        {return new Symbol(LexicalUnit.NUMBER,yyline, yycolumn, yytext());}
":="            {return new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn, ":=");}
{EndLine}		{return new Symbol(LexicalUnit.ENDLINE,yyline, yycolumn, "\\n");}

// Relational operators
"=="	        { return new Symbol(LexicalUnit.EQ,yyline, yycolumn, "==");}
">"		        {return new Symbol(LexicalUnit.GT,yyline, yycolumn,">");}

// If/Else keywords  Remark : if we don't put a space between If and if (IFif), it will take the token with only IF
// Is it correct? In my opinion : no. So we have to put above a space but it's not on point right now

 
"IF"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn, "IF");}
"THEN"          {return new Symbol(LexicalUnit.THEN,yyline, yycolumn, "THEN");}
"ENDIF"         {return new Symbol(LexicalUnit.ENDIF,yyline, yycolumn, "ENDIF");}
"ELSE"          {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn, "ELSE");}
"WHILE"			{return new Symbol(LexicalUnit.WHILE,yyline, yycolumn, "WHILE");}
"DO"			{return new Symbol(LexicalUnit.DO,yyline, yycolumn, "DO");}
"ENDWHILE"		{return new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn, "ENDWHILE");}

","             {return new Symbol(LexicalUnit.COMMA,yyline, yycolumn, ",");}


// Ignore the rest
.               {}

