all:
	jflex ../src/LexicalAnalyzer.flex
	javac -d ../bin -cp ../src ../src/Main.java

.PHONY: all comments comparisons errors instructions names operations parenthesis program signsnumber fortrs clean

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

fortrs:
	@java -cp ../bin Main ./FortrS/Average.fs >file 
	@diff -b --strip-trailing-cr ./FortrS/Average.output file && echo "Average : Test Successful" || echo "Average : Test Failed"
	@rm -f file
	@java -cp ../bin Main ./FortrS/Exponent.fs >file 
	@diff -b --strip-trailing-cr ./FortrS/Exponent.output file && echo "Exponent : Test Successful" || echo "Exponent : Test Failed"
	@rm -f file
	@java -cp ../bin Main ./FortrS/Factorial.fs >file 
	@diff -b --strip-trailing-cr ./FortrS/Factorial.output file && echo "Factorial : Test Successful" || echo "Factorial : Test Failed"
	@rm -f file
	@java -cp ../bin Main ./FortrS/Fibonacci.fs >file 
	@diff -b --strip-trailing-cr ./FortrS/Fibonacci.output file && echo "Fibonacci : Test Successful" || echo "Fibonacci : Test Failed"
	@rm -f file
	@java -cp ../bin Main ./FortrS/Maximum.fs >file 
	@diff -b --strip-trailing-cr ./FortrS/Maximum.output file && echo "Maximum : Test Successful" || echo "Maximum : Test Failed"
	@rm -f file

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