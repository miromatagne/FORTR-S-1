%%// Options of the scanner

%class LexicalAnalyzer	//Name
%unicode		//Use unicode
%line         	//Use line counter (yyline variable)
%column       	//Use character counter by line (yycolumn variable)
%type Symbol  //Says that the return type is Symbol
%standalone

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

Sign           = [+-]
Integer        = {Sign}?(([1-9][0-9]*)|0)
Decimal        = \.[0-9]*
Exponent       = [eE]{Integer}
Real           = {Integer}{Decimal}?{Exponent}?
Identifier     = {Alpha}{AlphaNumeric}*

%%// Identification of tokens

// Relational operators
"=="	        { return new Symbol(LexicalUnit.EQ,yyline, yycolumn);}
">"		        {return new Symbol(LexicalUnit.GT,yyline, yycolumn,">");}

// If/Else keywords
"if"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn);}
"then"        {return new Symbol(LexicalUnit.THEN,yyline, yycolumn);}
"else"        {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn);}

.             {}