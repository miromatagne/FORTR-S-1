all:
	jflex src/LexicalAnalyzer.flex
	javac -d bin -cp src src/Main.java
	jar cfe dist/part1.jar Main -C bin .

testing:
	java -jar dist/part1.jar test/Factorial.fs