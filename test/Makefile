all:
	jflex ../src/LexicalAnalyzer.flex
	javac -d ../bin -cp ../src ../src/Main.java

testing:
	@java -cp ../bin Main ./Parenthesis/Parenthesis.fs >file 
	@diff -u ./Parenthesis/Parenthesis.output file && echo "Test success" || echo "Test failure"
	@rm -f file
