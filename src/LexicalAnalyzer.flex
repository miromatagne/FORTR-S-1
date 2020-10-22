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

AlphaUpperCase 	= [A-Z]
AlphaLowerCase 	= [a-z]
Alpha          	= {AlphaUpperCase}|{AlphaLowerCase}
Numeric        	= [0-9]
AlphaNumeric   	= {Alpha}|{Numeric}
AlphaLowNumeric	= {AlphaLowerCase}|{Numeric}
Space          	= "\t"|" "
Any 		   	= .
NewLine		   	= "\n"		
EndOfLine	    = "\r"?"\n"

Sign           	= [+-]
Integer        	= {Sign}?(([1-9][0-9]*)|0)
//Decimal      	= \.[0-9]*
//Exponent     	= [eE]{Integer}
Number         	= (([1-9][0-9]*)|0)

VarName        	= {AlphaLowerCase}{AlphaLowNumeric}*
ProgName       	= {AlphaUpperCase}+{AlphaLowNumeric}+{AlphaNumeric}*
Comment 	   	= ("/*"(.|{EndOfLine})*"*/"|"//".*)

VarnameError 	= {AlphaLowerCase}+{AlphaLowNumeric}*[^{AlphaLowerCase}{Numeric}"\t"" ""\n""\r\n"]+[^"\t"" ""\n""\r\n"]*
ProgNameError 	= {AlphaUpperCase}+ 
NumError		= {Numeric}+{Alpha}+{AlphaNumeric}*

%%// Identification of tokens

{Comment}		{System.out.println("COMMENT");}

{VarnameError}			{System.out.println("ERROR :" + yytext());}
{NumError}				{System.out.println("NUM ERROR :" + yytext());}

{ProgName}      {return new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn, yytext());}
{Number}        {return new Symbol(LexicalUnit.NUMBER,yyline, yycolumn, yytext());}
{VarName}       {return new Symbol(LexicalUnit.VARNAME,yyline, yycolumn, yytext());}

":="            {return new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn, yytext());}

// Check weather the program starts or ends
"BEGINPROG"	    {return new Symbol(LexicalUnit.BEGINPROG,yyline, yycolumn,yytext());}
"ENDPROG"		{return new Symbol(LexicalUnit.ENDPROG,yyline, yycolumn,yytext());}

//Operations
"+"				{return new Symbol(LexicalUnit.PLUS,yyline, yycolumn, yytext());}
"-"				{return new Symbol(LexicalUnit.MINUS,yyline, yycolumn, yytext());}
"*"				{return new Symbol(LexicalUnit.TIMES,yyline, yycolumn, yytext());}
"/"				{return new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn, yytext());}

//Check for parenthesis or commas
"("				{return new Symbol(LexicalUnit.LPAREN,yyline, yycolumn, yytext());}
")"				{return new Symbol(LexicalUnit.RPAREN,yyline, yycolumn, yytext());}
","             {return new Symbol(LexicalUnit.COMMA,yyline, yycolumn, yytext());}

// Relational operators
"=="	        { return new Symbol(LexicalUnit.EQ,yyline, yycolumn, yytext());}
">"		        {return new Symbol(LexicalUnit.GT,yyline, yycolumn,yytext());}

//PRINT and READ commands
"PRINT"	        {return new Symbol(LexicalUnit.PRINT,yyline, yycolumn, yytext());}
"READ"	        {return new Symbol(LexicalUnit.READ,yyline, yycolumn, yytext());}


// If/Else keywords  Remark : if we don't put a space between If and if (IFif), it will take the token with only IF
// Is it correct? In my opinion : no. So we have to put above a space but it's not on point right now
"IF"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn, yytext());}
"THEN"          {return new Symbol(LexicalUnit.THEN,yyline, yycolumn, yytext());}
"ENDIF"         {return new Symbol(LexicalUnit.ENDIF,yyline, yycolumn, yytext());}
"ELSE"          {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn, yytext());}
"WHILE"			{return new Symbol(LexicalUnit.WHILE,yyline, yycolumn, yytext());}
"DO"			{return new Symbol(LexicalUnit.DO,yyline, yycolumn, yytext());}
"ENDWHILE"		{return new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn, yytext());}


// Ignore the rest
{ProgNameError}			{System.out.println("PROGNAME ERROR :" + yytext());}
.               {}
{EndOfLine}		{return new Symbol(LexicalUnit.ENDLINE,yyline, yycolumn, "\\n");}

