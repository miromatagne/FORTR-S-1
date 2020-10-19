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

Sign           = [+-]
Integer        = {Sign}?(([1-9][0-9]*)|0)
Decimal        = \.[0-9]*
Exponent       = [eE]{Integer}
Real           = {Integer}{Decimal}?{Exponent}?
Identifier     = {Alpha}{AlphaNumeric}*
//Everything     = 

//Comment        = "//"{Identifier}"\n"     
/*il faudrait quand meme un état pour Comment je pense, pcq dans un commentaire on peut mettre tout, 
le fait de définir à l'avance ce qu'il y aura déjà dedans fait qu'on pourra trouver un commentaire avec un contenu dont le compiler 
ne détectera pas.
Mon idée : créer state Comment. A l'intérieur mettre les différents Regex (ex. : alphanumeric, real, etc.), et puis mettre les actions
(en l'occurence, ils font rien du tout).
*/

%%// Identification of tokens

// Relational operators
"=="	        { return new Symbol(LexicalUnit.EQ,yyline, yycolumn, "==");}
">"		        {return new Symbol(LexicalUnit.GT,yyline, yycolumn,">");}

// If/Else keywords
"IF"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn, "IF");}
"THEN"          {return new Symbol(LexicalUnit.THEN,yyline, yycolumn, "THEN");}
"ELSE"          {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn, "ELSE");}
.               {}
"\n"			{}