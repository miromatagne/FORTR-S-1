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
Space          = "\t"|" "
EndOfLine		= "\r"?"\n"
Comment 	   = ("/*"(.|{EndOfLine})*"*/"|"//".*)	

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

{Comment}		{System.out.println("COMMENT");}

// Check weather the program starts or ends
"BEGINPROG"	    {return new Symbol(LexicalUnit.BEGINPROG,yyline, yycolumn,"BEGINPROG");}
"ENDPROG"		{return new Symbol(LexicalUnit.ENDPROG,yyline, yycolumn,"ENDPROG");}

// Comparing operators
"=="	        {return new Symbol(LexicalUnit.EQ,yyline, yycolumn, "==");}
">"		        {return new Symbol(LexicalUnit.GT,yyline, yycolumn,">");}

//Operations
"+"				{return new Symbol(LexicalUnit.PLUS,yyline, yycolumn, "+");}
"-"				{return new Symbol(LexicalUnit.MINUS,yyline, yycolumn, "-");}
"*"				{return new Symbol(LexicalUnit.TIMES,yyline, yycolumn, "*");}
"/"				{return new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn, "/");}

//Check for parenthesis
"("				{return new Symbol(LexicalUnit.LPAREN,yyline, yycolumn, "(");}
")"				{return new Symbol(LexicalUnit.RPAREN,yyline, yycolumn, ")");}

// If/Else keywords  Remark : if we don't put a space between If and if (IFif), it will take the token with only IF
// Is it correct? In my opinion : no. So we have to put above a space but it's not on point right now
"IF"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn, "IF");}
"THEN"          {return new Symbol(LexicalUnit.THEN,yyline, yycolumn, "THEN");}
"ENDIF"         {return new Symbol(LexicalUnit.ENDIF,yyline, yycolumn, "ENDIF");}
"ELSE"          {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn, "ELSE");}
"WHILE"			{return new Symbol(LexicalUnit.WHILE,yyline, yycolumn, "WHILE");}
"DO"			{return new Symbol(LexicalUnit.DO,yyline, yycolumn, "DO");}
"ENDWHILE"		{return new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn, "ENDWHILE");}


// Ignore the rest
.               {}
{EndOfLine}		{return new Symbol(LexicalUnit.ENDLINE,yyline, yycolumn, "\\n");}
