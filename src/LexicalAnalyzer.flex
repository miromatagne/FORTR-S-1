%%// Options of the scanner

%class LexicalAnalyzer	//Name
%unicode		//Use unicode
%line         	//Use line counter (yyline variable)
%column       	//Use character counter by line (yycolumn variable)
%type Symbol  //Says that the return type is Symbol
%function nextToken

%xstate YYINITIAL, COMMENT


%{
	private int commentDepth = 0;
%}

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
EndOfLine	    = "\r"?"\n"

Number         	= (([1-9][0-9]*)|0)

VarName        	= {AlphaLowerCase}{AlphaLowNumeric}*
ProgName       	= {AlphaUpperCase}+{AlphaLowNumeric}+{AlphaNumeric}*
InlineComment 	= "//".*

VarnameError 	= {AlphaLowerCase}+{AlphaLowNumeric}*{AlphaUpperCase}+{AlphaNumeric}*
ProgNameError 	= {AlphaUpperCase}+ 
NumError		= {Numeric}+{Alpha}+{AlphaNumeric}*
ZeroError       = (0){Numeric}+

%%// Identification of tokens

<YYINITIAL>{
	"/*"				{commentDepth++;yybegin(COMMENT);}
	{InlineComment}		{System.out.println("INLINE COMMENT");}

	{VarnameError}	{System.out.println("VAR ERROR :" + yytext());}
	{NumError}		{System.out.println("NUM ERROR :" + yytext());}
	{ZeroError}     {System.out.println("Zero ERROR :" + yytext());}

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


	// If/Else keywords
	"IF"	        {return new Symbol(LexicalUnit.IF,yyline, yycolumn, yytext());}
	"THEN"          {return new Symbol(LexicalUnit.THEN,yyline, yycolumn, yytext());}
	"ENDIF"         {return new Symbol(LexicalUnit.ENDIF,yyline, yycolumn, yytext());}
	"ELSE"          {return new Symbol(LexicalUnit.ELSE,yyline, yycolumn, yytext());}
	"WHILE"			{return new Symbol(LexicalUnit.WHILE,yyline, yycolumn, yytext());}
	"DO"			{return new Symbol(LexicalUnit.DO,yyline, yycolumn, yytext());}
	"ENDWHILE"		{return new Symbol(LexicalUnit.ENDWHILE,yyline, yycolumn, yytext());}


	// Ignore the rest
	{ProgNameError}	{System.out.println("PROGNAME ERROR :" + yytext());}
	{Space}         {}
	.               {System.out.println("ERROR :" + yytext());}
	{EndOfLine}		{return new Symbol(LexicalUnit.ENDLINE,yyline, yycolumn, "\\n");}
}

<COMMENT>{
	"*/"			{commentDepth--; if(commentDepth == 0) {yybegin(YYINITIAL);}}
	"/*"			{commentDepth++;}
	.				{}
	{EndOfLine}		{}	
}