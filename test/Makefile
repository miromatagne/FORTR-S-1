all:
	jflex ../src/LexicalAnalyzer.flex
	javac -d ../bin -cp ../src ../src/Main.java

.PHONY: all comments comparisons errors instructions names operations parenthesis program signsnumber clean

comments:
	@java -cp ../bin Main ./Comments/Comments.fs >file 
	@diff -b --strip-trailing-cr ./Comments/Comments.output file && echo "Comments : Test Successful" || echo "Comments : Test Failed"
	@rm -f file

comparisons:
	@java -cp ../bin Main ./Comparisons/Comparisons.fs >file 
	@diff -b --strip-trailing-cr ./Comparisons/Comparisons.output file && echo "Comparisons : Test Successful" || echo "Comparisons : Test Failed"
	@rm -f file

errors:
	@java -cp ../bin Main ./Errors/Errors.fs >file 
	@diff -b --strip-trailing-cr ./Errors/Errors.output file && echo "Errors : Test Successful" || echo "Errors : Test Failed"
	@rm -f file

fortrS:
	@
	@

instructions:
	@java -cp ../bin Main ./Instructions/Instructions.fs >file 
	@diff -b --strip-trailing-cr ./Instructions/Instructions.output file && echo "Instructions : Test Successful" || echo "Instructions : Test Failed"
	@rm -f file
	
names:
	@java -cp ../bin Main ./Names/Names.fs >file 
	@diff -b --strip-trailing-cr ./Names/Names.output file && echo "Names : Test Successful" || echo "Names : Test Failed"
	@rm -f file

operations:
	@java -cp ../bin Main ./Operations/Operations.fs >file 
	@diff -b --strip-trailing-cr ./Operations/Operations.output file && echo "Operations : Test Successful" || echo "Operations : Test Failed"
	@rm -f file

parenthesis:
	@java -cp ../bin Main ./Parenthesis/Parenthesis.fs >file 
	@diff -b --strip-trailing-cr ./Parenthesis/Parenthesis.output file && echo "Parenthesis : Test Successful" || echo "Parenthesis : Test Failed"
	@rm -f file

program:
	@java -cp ../bin Main ./Program/Program.fs >file 
	@diff -b --strip-trailing-cr ./Program/Program.output file && echo "Program : Test Successful" || echo "Program : Test Failed"
	@rm -f file

signsnumber:
	@java -cp ../bin Main ./Signs_Number/Signs_Number.fs >file 
	@diff -b --strip-trailing-cr ./Signs_Number/Signs_Number.output file && echo "Signs_Number : Test Successful" || echo "Signs_Number : Test Failed"
	@rm -f file

test:
	@make comments
	@make comparisons
	@make errors
	@make instructions
	@make names
	@make operations
	@make parenthesis
	@make program
	@make signsnumber